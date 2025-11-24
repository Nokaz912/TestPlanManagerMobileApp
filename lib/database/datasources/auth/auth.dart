import '../../../features/auth/domain/enitites/auth_token.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokens> exchangeCode({
    required String code,
    required String verifier,
  });

  Future<AuthTokens> refreshToken(String refreshToken);
}
