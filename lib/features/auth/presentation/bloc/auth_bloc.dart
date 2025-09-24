import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hhproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_event.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(Unauthenticated());
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.login(event.email, event.password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("userEmail", event.email);
      await prefs.setString("userPassword", event.password);
      await prefs.setBool("isLoggedIn", true);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.register(event.email, event.password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("userEmail", event.email);
      await prefs.setString("userPassword", event.password);
      await prefs.setBool("isLoggedIn", true);
      print("REGISTER SUCCESS: $user");
      emit(Authenticated(user));
      print("REGISTER SUCCESS: $user");
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await authRepository.logout();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("userEmail");
    await prefs.remove("userPassword");
    await prefs.setBool("isLoggedIn", false);

    emit(Unauthenticated());
  }
}
