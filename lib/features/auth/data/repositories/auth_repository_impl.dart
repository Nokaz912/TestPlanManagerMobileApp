import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/global/pkce_service/pkce_service.dart';
import '../../../../database/graph/remote_datasource.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final PkceService pkceService;
  final FlutterSecureStorage secureStorage;

  static const _pkceKey = "pkce_verifier";

  PkcePair? _pkce; // trzymamy tylko do generowania URL

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.pkceService,
    required this.secureStorage,
  });

  @override
  Future<String> createLoginUrl() async {
    // 1. Generuj PKCE
    _pkce = pkceService.generate();

    // 2. Zapisz verifier w bezpiecznym storage
    await secureStorage.write(key: _pkceKey, value: _pkce!.verifier);

    // 3. Przygotuj parametry do URL
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
  Future<String> loginWithCode(String code) async {
    // 1. Pobierz verifier ze storage
    final storedVerifier = await secureStorage.read(key: _pkceKey);

    if (storedVerifier == null || storedVerifier.isEmpty) {
      throw Exception(
        "Brak PKCE verifier — najpierw wywołaj createLoginUrl() i wróć z logowania.",
      );
    }

    // 2. Wymień kod na token
    final token = await remoteDataSource.exchangeCode(
      code: code,
      verifier: storedVerifier,
    );

    // 3. Usuń PKCE verifier po użyciu
    await secureStorage.delete(key: _pkceKey);

    return token;
  }

  @override
  PkcePair get currentPkce {
    if (_pkce == null) {
      throw Exception("PKCE nie zostało jeszcze wygenerowane.");
    }
    return _pkce!;
  }
}
