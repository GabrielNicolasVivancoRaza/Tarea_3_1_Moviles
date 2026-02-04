import 'package:hive/hive.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  static const String _boxName = 'contactos';

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal();

  Future<Box> get _box async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox(_boxName);
    }
    return Hive.box(_boxName);
  }

  // CRUD Operations
  Future<List<Map<String, dynamic>>> getAllContactos() async {
    final box = await _box;
    final List<Map<String, dynamic>> contactos = [];
    
    for (var key in box.keys) {
      final data = box.get(key) as Map;
      contactos.add({
        'id': key as int,
        'nombre': data['nombre'],
        'telefono': data['telefono'],
        'email': data['email'],
        'descripcion': data['descripcion'],
        'foto': data['foto'],
      });
    }
    
    // Ordenar por nombre
    contactos.sort((a, b) => (a['nombre'] as String).compareTo(b['nombre'] as String));
    return contactos;
  }

  Future<Map<String, dynamic>?> getContactoById(int id) async {
    final box = await _box;
    final data = box.get(id);
    
    if (data == null) return null;
    
    return {
      'id': id,
      'nombre': data['nombre'],
      'telefono': data['telefono'],
      'email': data['email'],
      'descripcion': data['descripcion'],
      'foto': data['foto'],
    };
  }

  Future<int> insertContacto(Map<String, dynamic> contacto) async {
    final box = await _box;
    
    // Generar un ID único
    int newId = 1;
    if (box.isNotEmpty) {
      final keys = box.keys.cast<int>();
      newId = keys.reduce((a, b) => a > b ? a : b) + 1;
    }
    
    await box.put(newId, {
      'nombre': contacto['nombre'],
      'telefono': contacto['telefono'],
      'email': contacto['email'],
      'descripcion': contacto['descripcion'],
      'foto': contacto['foto'],
    });
    
    return newId;
  }

  Future<int> updateContacto(Map<String, dynamic> contacto) async {
    final box = await _box;
    final id = contacto['id'] as int;
    
    await box.put(id, {
      'nombre': contacto['nombre'],
      'telefono': contacto['telefono'],
      'email': contacto['email'],
      'descripcion': contacto['descripcion'],
      'foto': contacto['foto'],
    });
    
    return 1;
  }

  Future<int> deleteContacto(int id) async {
    final box = await _box;
    await box.delete(id);
    return 1;
  }

  Future<List<Map<String, dynamic>>> searchContactos(String query) async {
    final allContactos = await getAllContactos();
    final queryLower = query.toLowerCase();
    
    return allContactos.where((contacto) {
      final nombre = (contacto['nombre'] as String).toLowerCase();
      final telefono = (contacto['telefono'] as String).toLowerCase();
      final email = (contacto['email'] as String).toLowerCase();
      
      return nombre.contains(queryLower) ||
             telefono.contains(queryLower) ||
             email.contains(queryLower);
    }).toList();
  }

  Future<void> close() async {
    final box = await _box;
    await box.close();
  }
}
