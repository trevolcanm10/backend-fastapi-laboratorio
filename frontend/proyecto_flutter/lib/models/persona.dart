class Persona {
  final int codigo;
  final String nombre;
  final String apellido;
  final String sexo;
  final String estadoCivil;

  Persona({
    required this.codigo,
    required this.nombre,
    required this.apellido,
    required this.sexo,
    required this.estadoCivil,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      codigo: json['codigo'] ?? 0,
      nombre: json['nombre'] ?? '',
      apellido: json['apellido'] ?? '',
      sexo: json['sexo'] ?? '',
      estadoCivil: json['estado_civil'] ?? '',
    );
  }
}