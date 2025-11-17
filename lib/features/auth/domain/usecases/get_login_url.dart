import '../repositories/auth_repository.dart';

class GetLoginUrl {
  final AuthRepository repo;
  GetLoginUrl(this.repo);

  Future<String> call() => repo.createLoginUrl();
}
