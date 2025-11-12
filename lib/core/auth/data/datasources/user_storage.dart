import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/models/authenticated_user.dart';

class UserStorage {
  static const String _boxName = 'user_box';
  static const String _userKey = 'authenticated_user';

  Future<void> saveUser(AuthenticatedUser user) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_userKey, {
      'cedula': user.cedula,
      'nombre': user.nombre,
      'telefono': user.telefono,
      'correo': user.correo,
      'ciudad': user.ciudad,
    });
  }

  Future<AuthenticatedUser?> getUser() async {
    final box = await Hive.openBox(_boxName);
    final data = box.get(_userKey) as Map?;
    
    if (data == null) return null;
    
    return AuthenticatedUser(
      cedula: data['cedula'] as String,
      nombre: data['nombre'] as String,
      telefono: data['telefono'] as String?,
      correo: data['correo'] as String?,
      ciudad: data['ciudad'] as String?,
    );
  }

  Future<void> clearUser() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_userKey);
  }
}
