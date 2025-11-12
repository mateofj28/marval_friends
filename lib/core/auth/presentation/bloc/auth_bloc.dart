import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(this._repository) : super(AuthInitial()) {
    on<AuthenticateRequested>(_onAuthenticateRequested);
  }

  Future<void> _onAuthenticateRequested(
    AuthenticateRequested event,
    Emitter<AuthState> emit,
  ) async {
    print('🔐 Iniciando autenticación...');
    emit(AuthLoading());
    try {
      final token = await _repository.authenticate();
      print('✅ Autenticación exitosa!');
      print('📋 Token Type: ${token.tokenType}');
      print('⏱️  Expira en: ${token.expiresIn} segundos');
      print('🔑 Access Token (primeros 50 caracteres): ${token.accessToken.substring(0, token.accessToken.length > 50 ? 50 : token.accessToken.length)}...');
      print('📊 Token completo guardado en el estado');
      emit(AuthSuccess(token));
    } catch (e) {
      print('❌ Error en autenticación: $e');
      emit(AuthFailure(e.toString()));
    }
  }
}
