class UserTalent {
  final int? id;
  final dynamic cedula;
  final String? nombre;
  final String? telefono;
  final String? correo;
  final String? ciudad;
  final String? codigoProyecto;
  final String? nombreProyecto;
  final String? inmueble;
  final int? valor;
  final String? fechaVenta;

  const UserTalent({
    this.id,
    this.cedula,
    this.nombre,
    this.telefono,
    this.correo,
    this.ciudad,
    this.codigoProyecto,
    this.nombreProyecto,
    this.inmueble,
    this.valor,
    this.fechaVenta,
  });

  String? get cedulaString => cedula?.toString();

  factory UserTalent.fromJson(Map<String, dynamic> json) {
    return UserTalent(
      id: json['id'] as int?,
      cedula: json['cedula'],
      nombre: json['nombre'] as String?,
      telefono: json['telefono'] as String?,
      correo: json['correo'] as String?,
      ciudad: json['ciudad'] as String?,
      codigoProyecto: json['codigo_proyecto'] as String?,
      nombreProyecto: json['nombre_proyecto'] as String?,
      inmueble: json['inmueble'] as String?,
      valor: json['valor'] as int?,
      fechaVenta: json['fecha_venta'] as String?,
    );
  }
}
