import '../../domain/entities/contacto.dart';
import '../../domain/respositories/contacto_repository.dart';

/// Use case for getting all contacts
class GetAllContactosUseCase {
  final ContactoRepository _repository;

  GetAllContactosUseCase(this._repository);

  Future<List<Contacto>> call() {
    return _repository.getAllContactos();
  }
}

/// Use case for getting a contact by ID
class GetContactoByIdUseCase {
  final ContactoRepository _repository;

  GetContactoByIdUseCase(this._repository);

  Future<Contacto?> call(int id) {
    return _repository.getContactoById(id);
  }
}

/// Use case for inserting a new contact
class InsertContactoUseCase {
  final ContactoRepository _repository;

  InsertContactoUseCase(this._repository);

  Future<int> call(Contacto contacto) {
    // Business logic validation
    if (contacto.nombre.trim().isEmpty) {
      throw Exception('El nombre no puede estar vacío');
    }
    if (contacto.telefono.trim().isEmpty) {
      throw Exception('El teléfono no puede estar vacío');
    }
    if (contacto.email.trim().isEmpty) {
      throw Exception('El email no puede estar vacío');
    }
    
    return _repository.insertContacto(contacto);
  }
}

/// Use case for updating a contact
class UpdateContactoUseCase {
  final ContactoRepository _repository;

  UpdateContactoUseCase(this._repository);

  Future<bool> call(Contacto contacto) {
    if (contacto.id == null) {
      throw Exception('El ID del contacto no puede ser nulo');
    }
    if (contacto.nombre.trim().isEmpty) {
      throw Exception('El nombre no puede estar vacío');
    }
    if (contacto.telefono.trim().isEmpty) {
      throw Exception('El teléfono no puede estar vacío');
    }
    if (contacto.email.trim().isEmpty) {
      throw Exception('El email no puede estar vacío');
    }
    
    return _repository.updateContacto(contacto);
  }
}

/// Use case for deleting a contact
class DeleteContactoUseCase {
  final ContactoRepository _repository;

  DeleteContactoUseCase(this._repository);

  Future<bool> call(int id) {
    return _repository.deleteContacto(id);
  }
}

/// Use case for searching contacts
class SearchContactosUseCase {
  final ContactoRepository _repository;

  SearchContactosUseCase(this._repository);

  Future<List<Contacto>> call(String query) {
    if (query.trim().isEmpty) {
      return _repository.getAllContactos();
    }
    return _repository.searchContactos(query);
  }
}
