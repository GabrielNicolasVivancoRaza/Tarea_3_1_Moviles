class Contacto {
  final int? id;
  final String nombre;
  final String telefono;
  final String email;
  final String descripcion;
  final String? foto;

  Contacto({
    this.id,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.descripcion,
    this.foto,
  });

  Contacto copyWith({
    int? id,
    String? nombre,
    String? telefono,
    String? email,
    String? descripcion,
    String? foto,
  }) {
    return Contacto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      descripcion: descripcion ?? this.descripcion,
      foto: foto ?? this.foto,
    );
  }
}
