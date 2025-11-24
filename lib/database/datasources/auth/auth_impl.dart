import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/database/datasources/auth/auth.dart';
import '../../../core/config/app_config.dart';
import '../../../features/auth/domain/enitites/auth_token.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio http;

  AuthRemoteDataSourceImpl(this.http);

  static String _tokenEndpoint(String tenant) =>
      "https://login.microsoftonline.com/$tenant/oauth2/v2.0/token";

  @override
  Future<AuthTokens> exchangeCode({
    required String code,
    required String verifier,
  }) async {
    final response = await http.post(
      _tokenEndpoint(AuthConfig.tenantId),
      data: {
        "client_id": AuthConfig.clientId,
        "scope": AuthConfig.scopes.join(" "),
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": AuthConfig.redirectUri,
        "code_verifier": verifier,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return _mapResponse(response.data);
  }

  @override
  Future<AuthTokens> refreshToken(String refreshToken) async {
    final response = await http.post(
      _tokenEndpoint(AuthConfig.tenantId),
      data: {
        "client_id": AuthConfig.clientId,
        "scope": AuthConfig.scopes.join(" "),
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return _mapResponse(response.data);
  }

  AuthTokens _mapResponse(Map<String, dynamic> json) {
    return AuthTokens(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresAt: DateTime.now().add(
        Duration(seconds: json['expires_in']),
      ),
    );
  }
}
