import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/auth/domain/repositories/auth_repository.dart';
import '../../../../core/auth/domain/models/authenticated_user.dart';
import '../../../../core/auth/data/datasources/user_storage.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repository;
  final UserStorage _userStorage;

  LoginBloc(this._repository, this._userStorage) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (event.documento.trim().isEmpty) {
      emit(LoginFailure('Por favor ingresa tu documento'));
      return;
    }

    print('🔐 Iniciando proceso de login...');
    emit(LoginLoading());

    try {
      final user = await _repository.validateAndGetUser(event.documento);

      if (user != null) {
        print('✅ Login exitoso');
        
        // Guardar usuario en storage
        final authenticatedUser = AuthenticatedUser.fromUserTalent(user);
        await _userStorage.saveUser(authenticatedUser);
        print('💾 Usuario guardado en storage');
        
        emit(LoginSuccess());
      } else {
        print('⚠️ Usuario no encontrado');
        emit(LoginUserNotFound());
      }
    } catch (e) {
      print('❌ Error en login: $e');
      emit(LoginFailure('Error al validar usuario: ${e.toString()}'));
    }
  }
}
