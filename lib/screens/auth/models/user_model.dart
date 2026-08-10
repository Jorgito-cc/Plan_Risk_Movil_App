// lib/screens/auth/models/user_model.dart
class UserModel {
  final int? id;            ///  <-- opcional (viene del backend)
  final String nombre;      /// requerido para registro / perfil
  final String? apellido;   /// opcional / requerido
  final String email;       /// requerido
  final String? password;   /// <-- opcional (no regresa del backend)
  final String? profesion;  /// 'estudiante', 'profesional', 'otro'
  final String? fechaNacimiento; /// 'yyyy-MM-dd'
  final int? telefono;      /// número telefónico
  final bool aceptaPoliticas; /// aceptación de T&C
  final String? fechaAceptacion; /// timestamp de aceptación

  const UserModel({
    this.id,
    required this.nombre,
    this.apellido,
    required this.email,
    this.password,
    this.profesion,
    this.fechaNacimiento,
    this.telefono,
    this.aceptaPoliticas = false,
    this.fechaAceptacion,
  });

  /// Para registro
  Map<String, dynamic> toJsonRegistro() => {
        'nombre': nombre,
        'apellido': apellido,
        'email': email,
        'password': password,
        'profesion': profesion,
        'fecha_nacimiento': fechaNacimiento,
        'telefono': telefono,
        'acepta_politicas': aceptaPoliticas,
        'fecha_aceptacion': fechaAceptacion,
      };

  /// Para login
  Map<String, dynamic> toJsonLogin() => {
        'email': email,
        'password': password, // aquí sí debe venir
      };

  /// Construir desde la respuesta del backend
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        nombre: (json['nombre'] ?? '') as String,
        apellido: json['apellido'] as String?,
        email: (json['email'] ?? '') as String,
        profesion: json['profesion'] as String?,
        fechaNacimiento: json['fecha_nacimiento'] as String?,
        telefono: json['telefono'] as int?,
        aceptaPoliticas: json['acepta_politicas'] as bool? ?? false,
        fechaAceptacion: json['fecha_aceptacion'] as String?,
      );
}
