import '../entities/contacto.dart';

/// Repository interface following DDD principles
abstract class ContactoRepository {
  Future<List<Contacto>> getAllContactos();
  Future<Contacto?> getContactoById(int id);
  Future<int> insertContacto(Contacto contacto);
  Future<bool> updateContacto(Contacto contacto);
  Future<bool> deleteContacto(int id);
  Future<List<Contacto>> searchContactos(String query);
}
