import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage secureStorage;
  final LoginUseCase loginUseCase;

  AuthBloc({
    required this.secureStorage,
    required this.loginUseCase,
  }) : super(AuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async {
      final token = await secureStorage.read(key: "access_token");
      print("🔍 [AuthBloc] Odczytany token: $token");

      if (token != null && token.isNotEmpty) {
        emit(AuthLoggedIn(token));
      } else {
        emit(AuthLoggedOut());
      }
    });

    on<LoginWithMicrosoftEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await loginUseCase(event.code);

        await secureStorage.write(key: "access_token", value: token);

        emit(AuthLoggedIn(token));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await secureStorage.deleteAll();
      emit(AuthLoggedOut());
    });
  }
}
