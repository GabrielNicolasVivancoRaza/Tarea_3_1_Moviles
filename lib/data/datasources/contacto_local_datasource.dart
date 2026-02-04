import '../../core/database/app_database.dart';
import '../../domain/entities/contacto.dart';

/// Local data source using Sqflite
class ContactoLocalDataSource {
  final AppDatabase _database;

  ContactoLocalDataSource(this._database);

  Future<List<Contacto>> getAllContactos() async {
    final maps = await _database.getAllContactos();
    return maps.map(_mapToEntity).toList();
  }

  Future<Contacto?> getContactoById(int id) async {
    final map = await _database.getContactoById(id);
    return map != null ? _mapToEntity(map) : null;
  }

  Future<int> insertContacto(Contacto contacto) async {
    final map = {
      'nombre': contacto.nombre,
      'telefono': contacto.telefono,
      'email': contacto.email,
      'descripcion': contacto.descripcion,
      'foto': contacto.foto,
    };
    return await _database.insertContacto(map);
  }

  Future<bool> updateContacto(Contacto contacto) async {
    if (contacto.id == null) return false;
    
    final map = {
      'id': contacto.id,
      'nombre': contacto.nombre,
      'telefono': contacto.telefono,
      'email': contacto.email,
      'descripcion': contacto.descripcion,
      'foto': contacto.foto,
    };
    final result = await _database.updateContacto(map);
    return result > 0;
  }

  Future<bool> deleteContacto(int id) async {
    final result = await _database.deleteContacto(id);
    return result > 0;
  }

  Future<List<Contacto>> searchContactos(String query) async {
    final maps = await _database.searchContactos(query);
    return maps.map(_mapToEntity).toList();
  }

  // Mapper: Map -> Domain Contacto
  Contacto _mapToEntity(Map<String, dynamic> map) {
    return Contacto(
      id: map['id'] as int?,
      nombre: map['nombre'] as String,
      telefono: map['telefono'] as String,
      email: map['email'] as String,
      descripcion: map['descripcion'] as String? ?? '',
      foto: map['foto'] as String?,
    );
  }
}

