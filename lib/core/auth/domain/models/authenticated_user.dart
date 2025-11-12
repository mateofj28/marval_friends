class AuthenticatedUser {
  final String cedula;
  final String nombre;
  final String? telefono;
  final String? correo;
  final String? ciudad;

  const AuthenticatedUser({
    required this.cedula,
    required this.nombre,
    this.telefono,
    this.correo,
    this.ciudad,
  });

  factory AuthenticatedUser.fromUserTalent(dynamic user) {
    return AuthenticatedUser(
      cedula: user.cedulaString ?? '',
      nombre: user.nombre ?? 'Usuario',
      telefono: user.telefono,
      correo: user.correo,
      ciudad: user.ciudad,
    );
  }
}
