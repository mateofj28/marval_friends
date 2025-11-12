import 'package:dio/dio.dart';
import '../../domain/models/auth_token.dart';
import '../../domain/models/user_talent.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_api_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<AuthToken> authenticate() async {
    try {
      final token = await _apiService.getToken('client_credentials');
      return token;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'Error de autenticación: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw Exception('Error de conexión: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }

  @override
  Future<List<UserTalent>> getTalentUsers(String token) async {
    try {
      final httpResponse = await _apiService.getTalentUsers('Bearer $token');
      final response = httpResponse.data;
      
      print('📦 Tipo de respuesta: ${response.runtimeType}');
      
      // La respuesta viene como Map con la clave "usuarios"
      if (response is Map<String, dynamic>) {
        if (response['usuarios'] != null) {
          final usuarios = response['usuarios'] as List;
          print('✅ Encontrados ${usuarios.length} usuarios en la clave "usuarios"');
          return usuarios.map((json) => UserTalent.fromJson(json as Map<String, dynamic>)).toList();
        } else if (response['items'] != null) {
          final items = response['items'] as List;
          return items.map((json) => UserTalent.fromJson(json as Map<String, dynamic>)).toList();
        } else if (response['data'] != null) {
          final data = response['data'] as List;
          return data.map((json) => UserTalent.fromJson(json as Map<String, dynamic>)).toList();
        }
      } else if (response is List) {
        return response.map((json) => UserTalent.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      print('⚠️ No se encontró una estructura de datos válida');
      return [];
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'Error al obtener usuarios: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw Exception('Error de conexión: ${e.message}');
      }
    } catch (e) {
      print('❌ Error al parsear usuarios: $e');
      throw Exception('Error inesperado al obtener usuarios: $e');
    }
  }

  @override
  Future<UserTalent?> validateAndGetUser(String documento) async {
    try {
      // Primero autenticamos
      final token = await authenticate();
      
      // Luego obtenemos la lista de usuarios
      final users = await getTalentUsers(token.accessToken);
      
      print('👥 Total de usuarios obtenidos: ${users.length}');
      print('\n📋 PRIMEROS 2 USUARIOS (muestra):');
      print('═' * 60);
      for (var i = 0; i < users.length && i < 2; i++) {
        final user = users[i];
        print('${i + 1}. Cédula: ${user.cedulaString ?? "N/A"}');
        if (user.nombre != null) print('   Nombre: ${user.nombre}');
        if (user.correo != null) print('   Email: ${user.correo}');
        if (user.telefono != null) print('   Teléfono: ${user.telefono}');
        if (user.ciudad != null) print('   Ciudad: ${user.ciudad}');
        print('─' * 60);
      }
      print('═' * 60);
      print('\n🔍 Buscando cédula: $documento');
      
      // Buscamos el usuario en la lista
      final foundUser = users.firstWhere(
        (user) => user.cedulaString?.trim() == documento.trim(),
        orElse: () => UserTalent(),
      );
      
      if (foundUser.cedula != null) {
        print('✅ Usuario encontrado: ${foundUser.nombre}');
        return foundUser;
      } else {
        print('❌ Usuario no encontrado');
        return null;
      }
    } catch (e) {
      print('❌ Error en validación: $e');
      rethrow;
    }
  }
}
