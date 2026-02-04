// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ContactosTable extends Contactos
    with TableInfo<$ContactosTable, ContactoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _telefonoMeta =
      const VerificationMeta('telefono');
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
      'telefono', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fotoMeta = const VerificationMeta('foto');
  @override
  late final GeneratedColumn<String> foto = GeneratedColumn<String>(
      'foto', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombre, telefono, email, descripcion, foto];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contactos';
  @override
  VerificationContext validateIntegrity(Insertable<ContactoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('telefono')) {
      context.handle(_telefonoMeta,
          telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta));
    } else if (isInserting) {
      context.missing(_telefonoMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('foto')) {
      context.handle(
          _fotoMeta, foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContactoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      telefono: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefono'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      foto: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}foto']),
    );
  }

  @override
  $ContactosTable createAlias(String alias) {
    return $ContactosTable(attachedDatabase, alias);
  }
}

class ContactoData extends DataClass implements Insertable<ContactoData> {
  final int id;
  final String nombre;
  final String telefono;
  final String email;
  final String descripcion;
  final String? foto;
  const ContactoData(
      {required this.id,
      required this.nombre,
      required this.telefono,
      required this.email,
      required this.descripcion,
      this.foto});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['telefono'] = Variable<String>(telefono);
    map['email'] = Variable<String>(email);
    map['descripcion'] = Variable<String>(descripcion);
    if (!nullToAbsent || foto != null) {
      map['foto'] = Variable<String>(foto);
    }
    return map;
  }

  ContactosCompanion toCompanion(bool nullToAbsent) {
    return ContactosCompanion(
      id: Value(id),
      nombre: Value(nombre),
      telefono: Value(telefono),
      email: Value(email),
      descripcion: Value(descripcion),
      foto: foto == null && nullToAbsent ? const Value.absent() : Value(foto),
    );
  }

  factory ContactoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactoData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      telefono: serializer.fromJson<String>(json['telefono']),
      email: serializer.fromJson<String>(json['email']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      foto: serializer.fromJson<String?>(json['foto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'telefono': serializer.toJson<String>(telefono),
      'email': serializer.toJson<String>(email),
      'descripcion': serializer.toJson<String>(descripcion),
      'foto': serializer.toJson<String?>(foto),
    };
  }

  ContactoData copyWith(
          {int? id,
          String? nombre,
          String? telefono,
          String? email,
          String? descripcion,
          Value<String?> foto = const Value.absent()}) =>
      ContactoData(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        telefono: telefono ?? this.telefono,
        email: email ?? this.email,
        descripcion: descripcion ?? this.descripcion,
        foto: foto.present ? foto.value : this.foto,
      );
  ContactoData copyWithCompanion(ContactosCompanion data) {
    return ContactoData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      email: data.email.present ? data.email.value : this.email,
      descripcion:
          data.descripcion.present ? data.descripcion.value : this.descripcion,
      foto: data.foto.present ? data.foto.value : this.foto,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContactoData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('descripcion: $descripcion, ')
          ..write('foto: $foto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombre, telefono, email, descripcion, foto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactoData &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.telefono == this.telefono &&
          other.email == this.email &&
          other.descripcion == this.descripcion &&
          other.foto == this.foto);
}

class ContactosCompanion extends UpdateCompanion<ContactoData> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> telefono;
  final Value<String> email;
  final Value<String> descripcion;
  final Value<String?> foto;
  const ContactosCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
    this.email = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.foto = const Value.absent(),
  });
  ContactosCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String telefono,
    required String email,
    required String descripcion,
    this.foto = const Value.absent(),
  })  : nombre = Value(nombre),
        telefono = Value(telefono),
        email = Value(email),
        descripcion = Value(descripcion);
  static Insertable<ContactoData> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? telefono,
    Expression<String>? email,
    Expression<String>? descripcion,
    Expression<String>? foto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (telefono != null) 'telefono': telefono,
      if (email != null) 'email': email,
      if (descripcion != null) 'descripcion': descripcion,
      if (foto != null) 'foto': foto,
    });
  }

  ContactosCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombre,
      Value<String>? telefono,
      Value<String>? email,
      Value<String>? descripcion,
      Value<String?>? foto}) {
    return ContactosCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      descripcion: descripcion ?? this.descripcion,
      foto: foto ?? this.foto,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String>(foto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactosCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('descripcion: $descripcion, ')
          ..write('foto: $foto')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ContactosTable contactos = $ContactosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contactos];
}

typedef $$ContactosTableCreateCompanionBuilder = ContactosCompanion Function({
  Value<int> id,
  required String nombre,
  required String telefono,
  required String email,
  required String descripcion,
  Value<String?> foto,
});
typedef $$ContactosTableUpdateCompanionBuilder = ContactosCompanion Function({
  Value<int> id,
  Value<String> nombre,
  Value<String> telefono,
  Value<String> email,
  Value<String> descripcion,
  Value<String?> foto,
});

class $$ContactosTableFilterComposer
    extends Composer<_$AppDatabase, $ContactosTable> {
  $$ContactosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get telefono => $composableBuilder(
      column: $table.telefono, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get foto => $composableBuilder(
      column: $table.foto, builder: (column) => ColumnFilters(column));
}

class $$ContactosTableOrderingComposer
    extends Composer<_$AppDatabase, $ContactosTable> {
  $$ContactosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get telefono => $composableBuilder(
      column: $table.telefono, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get foto => $composableBuilder(
      column: $table.foto, builder: (column) => ColumnOrderings(column));
}

class $$ContactosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContactosTable> {
  $$ContactosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => column);

  GeneratedColumn<String> get foto =>
      $composableBuilder(column: $table.foto, builder: (column) => column);
}

class $$ContactosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContactosTable,
    ContactoData,
    $$ContactosTableFilterComposer,
    $$ContactosTableOrderingComposer,
    $$ContactosTableAnnotationComposer,
    $$ContactosTableCreateCompanionBuilder,
    $$ContactosTableUpdateCompanionBuilder,
    (
      ContactoData,
      BaseReferences<_$AppDatabase, $ContactosTable, ContactoData>
    ),
    ContactoData,
    PrefetchHooks Function()> {
  $$ContactosTableTableManager(_$AppDatabase db, $ContactosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nombre = const Value.absent(),
            Value<String> telefono = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
            Value<String?> foto = const Value.absent(),
          }) =>
              ContactosCompanion(
            id: id,
            nombre: nombre,
            telefono: telefono,
            email: email,
            descripcion: descripcion,
            foto: foto,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nombre,
            required String telefono,
            required String email,
            required String descripcion,
            Value<String?> foto = const Value.absent(),
          }) =>
              ContactosCompanion.insert(
            id: id,
            nombre: nombre,
            telefono: telefono,
            email: email,
            descripcion: descripcion,
            foto: foto,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ContactosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContactosTable,
    ContactoData,
    $$ContactosTableFilterComposer,
    $$ContactosTableOrderingComposer,
    $$ContactosTableAnnotationComposer,
    $$ContactosTableCreateCompanionBuilder,
    $$ContactosTableUpdateCompanionBuilder,
    (
      ContactoData,
      BaseReferences<_$AppDatabase, $ContactosTable, ContactoData>
    ),
    ContactoData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ContactosTableTableManager get contactos =>
      $$ContactosTableTableManager(_db, _db.contactos);
}
