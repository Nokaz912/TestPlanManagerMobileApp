// login_usecase.dart
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> call(String code) {
    return repository.loginWithCode(code);
  }
}
