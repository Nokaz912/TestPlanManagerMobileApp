import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/global/pkce_service/pkce_service.dart';
import '../../../../database/datasources/auth/auth.dart';
import '../../domain/enitites/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final FlutterSecureStorage secureStorage;
  final PkceService pkceService;

  static const _pkceKey = "pkce";
  static const _accessKey = "access_token";
  static const _refreshKey = "refresh_token";
  static const _expKey = "expires_at";

  PkcePair? _pkce;

  AuthRepositoryImpl({
    required this.remote,
    required this.secureStorage,
    required this.pkceService,
  });

  @override
  Future<String> createLoginUrl() async {
    _pkce = pkceService.generate();
    await secureStorage.write(key: _pkceKey, value: _pkce!.verifier);

    final scope = Uri.encodeComponent(AuthConfig.scopes.join(" "));
    final redirect = Uri.encodeComponent(AuthConfig.redirectUri);

    return "https://login.microsoftonline.com/${AuthConfig.tenantId}/oauth2/v2.0/authorize"
        "?client_id=${AuthConfig.clientId}"
        "&response_type=code"
        "&redirect_uri=$redirect"
        "&scope=$scope"
        "&response_mode=query"
        "&code_challenge=${_pkce!.challenge}"
        "&code_challenge_method=S256";
  }

  @override
  Future<void> loginWithCode(String code) async {
    final verifier = await secureStorage.read(key: _pkceKey);
    if (verifier == null) throw Exception("Missing PKCE verifier");

    final tokens = await remote.exchangeCode(
      code: code,
      verifier: verifier,
    );

    await secureStorage.delete(key: _pkceKey);

    await _saveTokens(tokens);
  }

  @override
  Future<String> getValidAccessToken() async {
    final access = await secureStorage.read(key: _accessKey);
    final refresh = await secureStorage.read(key: _refreshKey);
    final expStr = await secureStorage.read(key: _expKey);

    if (access == null || refresh == null || expStr == null) {
      throw Exception("Not logged in");
    }

    final exp = DateTime.parse(expStr);

    if (exp.isAfter(DateTime.now().add(const Duration(minutes: 1)))) {
      return access;
    }

    final newTokens = await remote.refreshToken(refresh);
    await _saveTokens(newTokens);

    return newTokens.accessToken;
  }

  @override
  Future<void> logout() async {
    await secureStorage.deleteAll();
  }

  @override
  Future<bool> isLoggedIn() async {
    return await secureStorage.read(key: _accessKey) != null;
  }

  Future<void> _saveTokens(AuthTokens tokens) async {
    await secureStorage.write(key: _accessKey, value: tokens.accessToken);
    await secureStorage.write(key: _refreshKey, value: tokens.refreshToken);
    await secureStorage.write(
        key: _expKey, value: tokens.expiresAt.toIso8601String());
  }
}
