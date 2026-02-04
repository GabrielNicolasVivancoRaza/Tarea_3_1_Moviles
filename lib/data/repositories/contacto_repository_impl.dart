import '../../domain/entities/contacto.dart';
import '../../domain/respositories/contacto_repository.dart';
import '../datasources/contacto_local_datasource.dart';

/// Concrete implementation of ContactoRepository
class ContactoRepositoryImpl implements ContactoRepository {
  final ContactoLocalDataSource _localDataSource;

  ContactoRepositoryImpl(this._localDataSource);

  @override
  Future<List<Contacto>> getAllContactos() async {
    try {
      return await _localDataSource.getAllContactos();
    } catch (e) {
      throw Exception('Error al obtener contactos: $e');
    }
  }

  @override
  Future<Contacto?> getContactoById(int id) async {
    try {
      return await _localDataSource.getContactoById(id);
    } catch (e) {
      throw Exception('Error al obtener contacto: $e');
    }
  }

  @override
  Future<int> insertContacto(Contacto contacto) async {
    try {
      return await _localDataSource.insertContacto(contacto);
    } catch (e) {
      throw Exception('Error al insertar contacto: $e');
    }
  }

  @override
  Future<bool> updateContacto(Contacto contacto) async {
    try {
      return await _localDataSource.updateContacto(contacto);
    } catch (e) {
      throw Exception('Error al actualizar contacto: $e');
    }
  }

  @override
  Future<bool> deleteContacto(int id) async {
    try {
      return await _localDataSource.deleteContacto(id);
    } catch (e) {
      throw Exception('Error al eliminar contacto: $e');
    }
  }

  @override
  Future<List<Contacto>> searchContactos(String query) async {
    try {
      return await _localDataSource.searchContactos(query);
    } catch (e) {
      throw Exception('Error al buscar contactos: $e');
    }
  }
}

