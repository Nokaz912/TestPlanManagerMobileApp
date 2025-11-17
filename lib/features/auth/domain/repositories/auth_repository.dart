abstract class AuthRepository {
  Future<String> loginWithCode(String code);
  Future<String> createLoginUrl();
}
