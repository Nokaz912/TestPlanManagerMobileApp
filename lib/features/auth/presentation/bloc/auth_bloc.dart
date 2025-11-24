import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final LoginUseCase loginUseCase;

  AuthBloc({
    required this.authRepository,
    required this.loginUseCase,
  }) : super(AuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async {
      emit(AuthLoading());
      final loggedIn = await authRepository.isLoggedIn();
      emit(loggedIn ? AuthLoggedIn() : AuthLoggedOut());
    });

    on<LoginWithMicrosoftEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await loginUseCase(event.code);
        emit(AuthLoggedIn());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await authRepository.logout();
      emit(AuthLoggedOut());
    });
  }
}
