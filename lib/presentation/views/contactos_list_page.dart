import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/contacto.dart';
import '../providers/contacto_providers.dart';
import '../widgets/contacto_form_dialog.dart';
import '../widgets/contacto_detail_page.dart';

class ContactosListPage extends ConsumerStatefulWidget {
  const ContactosListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactosListPage> createState() => _ContactosListPageState();
}

class _ContactosListPageState extends ConsumerState<ContactosListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showAddContactDialog() {
    showDialog(
      context: context,
      builder: (context) => ContactoFormDialog(
        onSave: (contacto) async {
          await ref.read(contactosProvider.notifier).addContacto(contacto);
          if (mounted) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Contacto agregado exitosamente')),
            );
          }
        },
      ),
    );
  }

  void _showEditContactDialog(Contacto contacto) {
    showDialog(
      context: context,
      builder: (context) => ContactoFormDialog(
        contacto: contacto,
        onSave: (updatedContacto) async {
          await ref.read(contactosProvider.notifier).updateContacto(updatedContacto);
          if (mounted) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Contacto actualizado exitosamente')),
            );
          }
        },
      ),
    );
  }

  void _deleteContacto(Contacto contacto) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Contacto'),
        content: Text('¿Estás seguro de eliminar a ${contacto.nombre}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(contactosProvider.notifier).deleteContacto(contacto.id!);
              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contacto eliminado')),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contactosAsync = ref.watch(contactosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(contactosProvider.notifier).loadContactos();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar contactos...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(contactosProvider.notifier).loadContactos();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                ref.read(contactosProvider.notifier).searchContactos(value);
              },
            ),
          ),
          Expanded(
            child: contactosAsync.when(
              data: (contactos) {
                if (contactos.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay contactos',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: contactos.length,
                  itemBuilder: (context, index) {
                    final contacto = contactos[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: contacto.foto != null && contacto.foto!.isNotEmpty
                              ? FileImage(File(contacto.foto!))
                              : null,
                          child: contacto.foto == null || contacto.foto!.isEmpty
                              ? Text(
                                  contacto.nombre.isNotEmpty ? contacto.nombre[0].toUpperCase() : '?',
                                )
                              : null,
                        ),
                        title: Text(
                          contacto.nombre,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(contacto.telefono),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Row(
                                children: [
                                  Icon(Icons.edit),
                                  SizedBox(width: 8),
                                  Text('Editar'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete),
                                  SizedBox(width: 8),
                                  Text('Eliminar'),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'edit') {
                              _showEditContactDialog(contacto);
                            } else if (value == 'delete') {
                              _deleteContacto(contacto);
                            }
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactoDetailPage(contacto: contacto),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${error.toString()}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(contactosProvider.notifier).loadContactos();
                      },
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddContactDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
