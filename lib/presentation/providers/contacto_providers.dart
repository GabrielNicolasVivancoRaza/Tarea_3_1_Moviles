import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/app_database.dart';
import '../../data/datasources/contacto_local_datasource.dart';
import '../../data/repositories/contacto_repository_impl.dart';
import '../../domain/respositories/contacto_repository.dart';
import '../../application/usecases/contacto_usecases.dart';
import '../../domain/entities/contacto.dart';

/// Provider for AppDatabase (Singleton)
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

/// Provider for ContactoLocalDataSource
final contactoLocalDataSourceProvider = Provider<ContactoLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return ContactoLocalDataSource(database);
});

/// Provider for ContactoRepository
final contactoRepositoryProvider = Provider<ContactoRepository>((ref) {
  final dataSource = ref.watch(contactoLocalDataSourceProvider);
  return ContactoRepositoryImpl(dataSource);
});

/// Use Cases Providers
final getAllContactosUseCaseProvider = Provider<GetAllContactosUseCase>((ref) {
  final repository = ref.watch(contactoRepositoryProvider);
  return GetAllContactosUseCase(repository);
});

final getContactoByIdUseCaseProvider = Provider<GetContactoByIdUseCase>((ref) {
  final repository = ref.watch(contactoRepositoryProvider);
  return GetContactoByIdUseCase(repository);
});

final insertContactoUseCaseProvider = Provider<InsertContactoUseCase>((ref) {
  final repository = ref.watch(contactoRepositoryProvider);
  return InsertContactoUseCase(repository);
});

final updateContactoUseCaseProvider = Provider<UpdateContactoUseCase>((ref) {
  final repository = ref.watch(contactoRepositoryProvider);
  return UpdateContactoUseCase(repository);
});

final deleteContactoUseCaseProvider = Provider<DeleteContactoUseCase>((ref) {
  final repository = ref.watch(contactoRepositoryProvider);
  return DeleteContactoUseCase(repository);
});

final searchContactosUseCaseProvider = Provider<SearchContactosUseCase>((ref) {
  final repository = ref.watch(contactoRepositoryProvider);
  return SearchContactosUseCase(repository);
});

/// StateNotifier for managing contacts state
class ContactosNotifier extends StateNotifier<AsyncValue<List<Contacto>>> {
  final GetAllContactosUseCase _getAllContactos;
  final InsertContactoUseCase _insertContacto;
  final UpdateContactoUseCase _updateContacto;
  final DeleteContactoUseCase _deleteContacto;
  final SearchContactosUseCase _searchContactos;

  ContactosNotifier(
    this._getAllContactos,
    this._insertContacto,
    this._updateContacto,
    this._deleteContacto,
    this._searchContactos,
  ) : super(const AsyncValue.loading()) {
    loadContactos();
  }

  Future<void> loadContactos() async {
    state = const AsyncValue.loading();
    try {
      final contactos = await _getAllContactos();
      state = AsyncValue.data(contactos);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addContacto(Contacto contacto) async {
    try {
      await _insertContacto(contacto);
      await loadContactos();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> updateContacto(Contacto contacto) async {
    try {
      await _updateContacto(contacto);
      await loadContactos();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> deleteContacto(int id) async {
    try {
      await _deleteContacto(id);
      await loadContactos();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> searchContactos(String query) async {
    state = const AsyncValue.loading();
    try {
      final contactos = await _searchContactos(query);
      state = AsyncValue.data(contactos);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

/// Provider for ContactosNotifier
final contactosProvider = StateNotifierProvider<ContactosNotifier, AsyncValue<List<Contacto>>>((ref) {
  return ContactosNotifier(
    ref.watch(getAllContactosUseCaseProvider),
    ref.watch(insertContactoUseCaseProvider),
    ref.watch(updateContactoUseCaseProvider),
    ref.watch(deleteContactoUseCaseProvider),
    ref.watch(searchContactosUseCaseProvider),
  );
});
