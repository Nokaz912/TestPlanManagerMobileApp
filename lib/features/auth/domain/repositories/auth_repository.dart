abstract class AuthRepository {
  Future<String> createLoginUrl();
  Future<void> loginWithCode(String code);
  Future<String> getValidAccessToken();
  Future<void> logout();
  Future<bool> isLoggedIn();
}
