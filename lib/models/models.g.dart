// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserCollectionReference
    implements
        UserQuery,
        FirestoreCollectionReference<User, UserQuerySnapshot> {
  factory UserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserCollectionReference;

  static User fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    User value,
    SetOptions? options,
  ) {
    return {..._$UserToJson(value)}..remove('id');
  }

  @override
  CollectionReference<User> get reference;

  @override
  UserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDocumentReference> add(User value);
}

class _$UserCollectionReference extends _$UserQuery
    implements UserCollectionReference {
  factory _$UserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserCollectionReference.fromFirestore,
            toFirestore: UserCollectionReference.toFirestore,
          ),
    );
  }

  _$UserCollectionReference._(
    CollectionReference<User> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<User> get reference =>
      super.reference as CollectionReference<User>;

  @override
  UserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDocumentReference> add(User value) {
    return reference.add(value).then((ref) => UserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDocumentReference
    extends FirestoreDocumentReference<User, UserDocumentSnapshot> {
  factory UserDocumentReference(DocumentReference<User> reference) =
      _$UserDocumentReference;

  DocumentReference<User> get reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  late final CategoryCollectionReference categories =
      _$CategoryCollectionReference(
    reference,
  );

  @override
  Stream<UserDocumentSnapshot> snapshots();

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String uid,
    FieldValue uidFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String uid,
    FieldValue uidFieldValue,
  });
}

class _$UserDocumentReference
    extends FirestoreDocumentReference<User, UserDocumentSnapshot>
    implements UserDocumentReference {
  _$UserDocumentReference(this.reference);

  @override
  final DocumentReference<User> reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  late final CategoryCollectionReference categories =
      _$CategoryCollectionReference(
    reference,
  );

  @override
  Stream<UserDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserDocumentSnapshot._);
  }

  Future<void> update({
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$UserFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$UserFieldMap['uid']!: uidFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$UserFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$UserFieldMap['uid']!: uidFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserQuery implements QueryReference<User, UserQuerySnapshot> {
  @override
  UserQuery limit(int limit);

  @override
  UserQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  UserQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });
}

class _$UserQuery extends QueryReference<User, UserQuerySnapshot>
    implements UserQuery {
  _$UserQuery(
    this._collection, {
    required Query<User> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserQuery limit(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery limitToLast(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  UserQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['uid']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['uid']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDocumentSnapshot extends FirestoreDocumentSnapshot<User> {
  UserDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<User> snapshot;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final User? data;
}

class UserQuerySnapshot
    extends FirestoreQuerySnapshot<User, UserQueryDocumentSnapshot> {
  UserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<User> snapshot,
  ) {
    final docs = snapshot.docs.map(UserQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserDocumentSnapshot._,
      );
    }).toList();

    return UserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<User> snapshot;

  @override
  final List<UserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDocumentSnapshot>> docChanges;
}

class UserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<User>
    implements UserDocumentSnapshot {
  UserQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<User> snapshot;

  @override
  final User data;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CategoryCollectionReference
    implements
        CategoryQuery,
        FirestoreCollectionReference<Category, CategoryQuerySnapshot> {
  factory CategoryCollectionReference(
    DocumentReference<User> parent,
  ) = _$CategoryCollectionReference;

  static Category fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$CategoryFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Category value,
    SetOptions? options,
  ) {
    return {..._$CategoryToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Category> get reference;

  /// A reference to the containing [UserDocumentReference] if this is a subcollection.
  UserDocumentReference get parent;

  @override
  CategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CategoryDocumentReference> add(Category value);
}

class _$CategoryCollectionReference extends _$CategoryQuery
    implements CategoryCollectionReference {
  factory _$CategoryCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$CategoryCollectionReference._(
      UserDocumentReference(parent),
      parent.collection('categories').withConverter(
            fromFirestore: CategoryCollectionReference.fromFirestore,
            toFirestore: CategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$CategoryCollectionReference._(
    this.parent,
    CollectionReference<Category> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Category> get reference =>
      super.reference as CollectionReference<Category>;

  @override
  CategoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CategoryDocumentReference> add(Category value) {
    return reference.add(value).then((ref) => CategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CategoryDocumentReference
    extends FirestoreDocumentReference<Category, CategoryDocumentSnapshot> {
  factory CategoryDocumentReference(DocumentReference<Category> reference) =
      _$CategoryDocumentReference;

  DocumentReference<Category> get reference;

  /// A reference to the [CategoryCollectionReference] containing this document.
  CategoryCollectionReference get parent {
    return _$CategoryCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  late final Sub1CategoryCollectionReference subcategories =
      _$Sub1CategoryCollectionReference(
    reference,
  );

  @override
  Stream<CategoryDocumentSnapshot> snapshots();

  @override
  Future<CategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String title,
    FieldValue titleFieldValue,
    String transactionType,
    FieldValue transactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    double? budget,
    FieldValue budgetFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String title,
    FieldValue titleFieldValue,
    String transactionType,
    FieldValue transactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    double? budget,
    FieldValue budgetFieldValue,
  });
}

class _$CategoryDocumentReference
    extends FirestoreDocumentReference<Category, CategoryDocumentSnapshot>
    implements CategoryDocumentReference {
  _$CategoryDocumentReference(this.reference);

  @override
  final DocumentReference<Category> reference;

  /// A reference to the [CategoryCollectionReference] containing this document.
  CategoryCollectionReference get parent {
    return _$CategoryCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  late final Sub1CategoryCollectionReference subcategories =
      _$Sub1CategoryCollectionReference(
    reference,
  );

  @override
  Stream<CategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CategoryDocumentSnapshot._);
  }

  @override
  Future<CategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CategoryDocumentSnapshot._);
  }

  @override
  Future<CategoryDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(CategoryDocumentSnapshot._);
  }

  Future<void> update({
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? transactionType = _sentinel,
    FieldValue? transactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) async {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      transactionType == _sentinel || transactionTypeFieldValue == null,
      "Cannot specify both transactionType and transactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$CategoryFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$CategoryFieldMap['title']!: titleFieldValue,
      if (transactionType != _sentinel)
        _$CategoryFieldMap['transactionType']!: transactionType as String,
      if (transactionTypeFieldValue != null)
        _$CategoryFieldMap['transactionType']!: transactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$CategoryFieldMap['categoryReason']!: categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$CategoryFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (budget != _sentinel) _$CategoryFieldMap['budget']!: budget as double?,
      if (budgetFieldValue != null)
        _$CategoryFieldMap['budget']!: budgetFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? transactionType = _sentinel,
    FieldValue? transactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      transactionType == _sentinel || transactionTypeFieldValue == null,
      "Cannot specify both transactionType and transactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$CategoryFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$CategoryFieldMap['title']!: titleFieldValue,
      if (transactionType != _sentinel)
        _$CategoryFieldMap['transactionType']!: transactionType as String,
      if (transactionTypeFieldValue != null)
        _$CategoryFieldMap['transactionType']!: transactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$CategoryFieldMap['categoryReason']!: categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$CategoryFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (budget != _sentinel) _$CategoryFieldMap['budget']!: budget as double?,
      if (budgetFieldValue != null)
        _$CategoryFieldMap['budget']!: budgetFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CategoryQuery
    implements QueryReference<Category, CategoryQuerySnapshot> {
  @override
  CategoryQuery limit(int limit);

  @override
  CategoryQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CategoryQuery whereTransactionType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CategoryQuery whereCategoryReason({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  CategoryQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  });

  CategoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  CategoryQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  CategoryQuery orderByTransactionType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  CategoryQuery orderByCategoryReason({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  CategoryQuery orderByBudget({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$CategoryQuery extends QueryReference<Category, CategoryQuerySnapshot>
    implements CategoryQuery {
  _$CategoryQuery(
    this._collection, {
    required Query<Category> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(CategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CategoryQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(CategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CategoryQuery limit(int limit) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CategoryQuery limitToLast(int limit) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['title']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CategoryQuery whereTransactionType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['transactionType']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CategoryQuery whereCategoryReason({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['categoryReason']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CategoryQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  }) {
    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['budget']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  CategoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CategoryQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CategoryFieldMap['title']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CategoryQuery orderByTransactionType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CategoryFieldMap['transactionType']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CategoryQuery orderByCategoryReason({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CategoryFieldMap['categoryReason']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CategoryQuery orderByBudget({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CategoryFieldMap['budget']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CategoryDocumentSnapshot extends FirestoreDocumentSnapshot<Category> {
  CategoryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Category> snapshot;

  @override
  CategoryDocumentReference get reference {
    return CategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Category? data;
}

class CategoryQuerySnapshot
    extends FirestoreQuerySnapshot<Category, CategoryQueryDocumentSnapshot> {
  CategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CategoryQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Category> snapshot,
  ) {
    final docs = snapshot.docs.map(CategoryQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CategoryDocumentSnapshot._,
      );
    }).toList();

    return CategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CategoryDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CategoryDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CategoryDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Category> snapshot;

  @override
  final List<CategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CategoryDocumentSnapshot>> docChanges;
}

class CategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Category>
    implements CategoryDocumentSnapshot {
  CategoryQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Category> snapshot;

  @override
  final Category data;

  @override
  CategoryDocumentReference get reference {
    return CategoryDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class Sub1CategoryCollectionReference
    implements
        Sub1CategoryQuery,
        FirestoreCollectionReference<Category, Sub1CategoryQuerySnapshot> {
  factory Sub1CategoryCollectionReference(
    DocumentReference<Category> parent,
  ) = _$Sub1CategoryCollectionReference;

  static Category fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$CategoryFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Category value,
    SetOptions? options,
  ) {
    return {..._$CategoryToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Category> get reference;

  /// A reference to the containing [CategoryDocumentReference] if this is a subcollection.
  CategoryDocumentReference get parent;

  @override
  Sub1CategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<Sub1CategoryDocumentReference> add(Category value);
}

class _$Sub1CategoryCollectionReference extends _$Sub1CategoryQuery
    implements Sub1CategoryCollectionReference {
  factory _$Sub1CategoryCollectionReference(
    DocumentReference<Category> parent,
  ) {
    return _$Sub1CategoryCollectionReference._(
      CategoryDocumentReference(parent),
      parent.collection('subcategories').withConverter(
            fromFirestore: Sub1CategoryCollectionReference.fromFirestore,
            toFirestore: Sub1CategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$Sub1CategoryCollectionReference._(
    this.parent,
    CollectionReference<Category> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final CategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Category> get reference =>
      super.reference as CollectionReference<Category>;

  @override
  Sub1CategoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return Sub1CategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<Sub1CategoryDocumentReference> add(Category value) {
    return reference
        .add(value)
        .then((ref) => Sub1CategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$Sub1CategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class Sub1CategoryDocumentReference
    extends FirestoreDocumentReference<Category, Sub1CategoryDocumentSnapshot> {
  factory Sub1CategoryDocumentReference(DocumentReference<Category> reference) =
      _$Sub1CategoryDocumentReference;

  DocumentReference<Category> get reference;

  /// A reference to the [Sub1CategoryCollectionReference] containing this document.
  Sub1CategoryCollectionReference get parent {
    return _$Sub1CategoryCollectionReference(
      reference.parent.parent!.withConverter<Category>(
        fromFirestore: CategoryCollectionReference.fromFirestore,
        toFirestore: CategoryCollectionReference.toFirestore,
      ),
    );
  }

  late final Sub2CategoryCollectionReference subcategories =
      _$Sub2CategoryCollectionReference(
    reference,
  );

  @override
  Stream<Sub1CategoryDocumentSnapshot> snapshots();

  @override
  Future<Sub1CategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String title,
    FieldValue titleFieldValue,
    String transactionType,
    FieldValue transactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    double? budget,
    FieldValue budgetFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String title,
    FieldValue titleFieldValue,
    String transactionType,
    FieldValue transactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    double? budget,
    FieldValue budgetFieldValue,
  });
}

class _$Sub1CategoryDocumentReference
    extends FirestoreDocumentReference<Category, Sub1CategoryDocumentSnapshot>
    implements Sub1CategoryDocumentReference {
  _$Sub1CategoryDocumentReference(this.reference);

  @override
  final DocumentReference<Category> reference;

  /// A reference to the [Sub1CategoryCollectionReference] containing this document.
  Sub1CategoryCollectionReference get parent {
    return _$Sub1CategoryCollectionReference(
      reference.parent.parent!.withConverter<Category>(
        fromFirestore: CategoryCollectionReference.fromFirestore,
        toFirestore: CategoryCollectionReference.toFirestore,
      ),
    );
  }

  late final Sub2CategoryCollectionReference subcategories =
      _$Sub2CategoryCollectionReference(
    reference,
  );

  @override
  Stream<Sub1CategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map(Sub1CategoryDocumentSnapshot._);
  }

  @override
  Future<Sub1CategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(Sub1CategoryDocumentSnapshot._);
  }

  @override
  Future<Sub1CategoryDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(Sub1CategoryDocumentSnapshot._);
  }

  Future<void> update({
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? transactionType = _sentinel,
    FieldValue? transactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) async {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      transactionType == _sentinel || transactionTypeFieldValue == null,
      "Cannot specify both transactionType and transactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$CategoryFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$CategoryFieldMap['title']!: titleFieldValue,
      if (transactionType != _sentinel)
        _$CategoryFieldMap['transactionType']!: transactionType as String,
      if (transactionTypeFieldValue != null)
        _$CategoryFieldMap['transactionType']!: transactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$CategoryFieldMap['categoryReason']!: categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$CategoryFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (budget != _sentinel) _$CategoryFieldMap['budget']!: budget as double?,
      if (budgetFieldValue != null)
        _$CategoryFieldMap['budget']!: budgetFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? transactionType = _sentinel,
    FieldValue? transactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      transactionType == _sentinel || transactionTypeFieldValue == null,
      "Cannot specify both transactionType and transactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$CategoryFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$CategoryFieldMap['title']!: titleFieldValue,
      if (transactionType != _sentinel)
        _$CategoryFieldMap['transactionType']!: transactionType as String,
      if (transactionTypeFieldValue != null)
        _$CategoryFieldMap['transactionType']!: transactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$CategoryFieldMap['categoryReason']!: categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$CategoryFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (budget != _sentinel) _$CategoryFieldMap['budget']!: budget as double?,
      if (budgetFieldValue != null)
        _$CategoryFieldMap['budget']!: budgetFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is Sub1CategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class Sub1CategoryQuery
    implements QueryReference<Category, Sub1CategoryQuerySnapshot> {
  @override
  Sub1CategoryQuery limit(int limit);

  @override
  Sub1CategoryQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  Sub1CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  Sub1CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  Sub1CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  Sub1CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  Sub1CategoryQuery whereTransactionType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  Sub1CategoryQuery whereCategoryReason({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  Sub1CategoryQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  });

  Sub1CategoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub1CategoryQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub1CategoryQuery orderByTransactionType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub1CategoryQuery orderByCategoryReason({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub1CategoryQuery orderByBudget({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$Sub1CategoryQuery
    extends QueryReference<Category, Sub1CategoryQuerySnapshot>
    implements Sub1CategoryQuery {
  _$Sub1CategoryQuery(
    this._collection, {
    required Query<Category> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<Sub1CategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(Sub1CategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<Sub1CategoryQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(Sub1CategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Sub1CategoryQuery limit(int limit) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  Sub1CategoryQuery limitToLast(int limit) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  Sub1CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub1CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub1CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub1CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['title']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub1CategoryQuery whereTransactionType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['transactionType']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub1CategoryQuery whereCategoryReason({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['categoryReason']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub1CategoryQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  }) {
    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['budget']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub1CategoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub1CategoryQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CategoryFieldMap['title']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub1CategoryQuery orderByTransactionType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CategoryFieldMap['transactionType']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub1CategoryQuery orderByCategoryReason({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CategoryFieldMap['categoryReason']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub1CategoryQuery orderByBudget({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub1CategoryDocumentSnapshot? startAtDocument,
    Sub1CategoryDocumentSnapshot? endAtDocument,
    Sub1CategoryDocumentSnapshot? endBeforeDocument,
    Sub1CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CategoryFieldMap['budget']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub1CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$Sub1CategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class Sub1CategoryDocumentSnapshot extends FirestoreDocumentSnapshot<Category> {
  Sub1CategoryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Category> snapshot;

  @override
  Sub1CategoryDocumentReference get reference {
    return Sub1CategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Category? data;
}

class Sub1CategoryQuerySnapshot extends FirestoreQuerySnapshot<Category,
    Sub1CategoryQueryDocumentSnapshot> {
  Sub1CategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory Sub1CategoryQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Category> snapshot,
  ) {
    final docs =
        snapshot.docs.map(Sub1CategoryQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        Sub1CategoryDocumentSnapshot._,
      );
    }).toList();

    return Sub1CategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<Sub1CategoryDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    Sub1CategoryDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<Sub1CategoryDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Category> snapshot;

  @override
  final List<Sub1CategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<Sub1CategoryDocumentSnapshot>> docChanges;
}

class Sub1CategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Category>
    implements Sub1CategoryDocumentSnapshot {
  Sub1CategoryQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Category> snapshot;

  @override
  final Category data;

  @override
  Sub1CategoryDocumentReference get reference {
    return Sub1CategoryDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class Sub2CategoryCollectionReference
    implements
        Sub2CategoryQuery,
        FirestoreCollectionReference<Category, Sub2CategoryQuerySnapshot> {
  factory Sub2CategoryCollectionReference(
    DocumentReference<Category> parent,
  ) = _$Sub2CategoryCollectionReference;

  static Category fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$CategoryFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Category value,
    SetOptions? options,
  ) {
    return {..._$CategoryToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Category> get reference;

  /// A reference to the containing [Sub1CategoryDocumentReference] if this is a subcollection.
  Sub1CategoryDocumentReference get parent;

  @override
  Sub2CategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<Sub2CategoryDocumentReference> add(Category value);
}

class _$Sub2CategoryCollectionReference extends _$Sub2CategoryQuery
    implements Sub2CategoryCollectionReference {
  factory _$Sub2CategoryCollectionReference(
    DocumentReference<Category> parent,
  ) {
    return _$Sub2CategoryCollectionReference._(
      Sub1CategoryDocumentReference(parent),
      parent.collection('subcategories').withConverter(
            fromFirestore: Sub2CategoryCollectionReference.fromFirestore,
            toFirestore: Sub2CategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$Sub2CategoryCollectionReference._(
    this.parent,
    CollectionReference<Category> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final Sub1CategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Category> get reference =>
      super.reference as CollectionReference<Category>;

  @override
  Sub2CategoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return Sub2CategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<Sub2CategoryDocumentReference> add(Category value) {
    return reference
        .add(value)
        .then((ref) => Sub2CategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$Sub2CategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class Sub2CategoryDocumentReference
    extends FirestoreDocumentReference<Category, Sub2CategoryDocumentSnapshot> {
  factory Sub2CategoryDocumentReference(DocumentReference<Category> reference) =
      _$Sub2CategoryDocumentReference;

  DocumentReference<Category> get reference;

  /// A reference to the [Sub2CategoryCollectionReference] containing this document.
  Sub2CategoryCollectionReference get parent {
    return _$Sub2CategoryCollectionReference(
      reference.parent.parent!.withConverter<Category>(
        fromFirestore: Sub1CategoryCollectionReference.fromFirestore,
        toFirestore: Sub1CategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<Sub2CategoryDocumentSnapshot> snapshots();

  @override
  Future<Sub2CategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String title,
    FieldValue titleFieldValue,
    String transactionType,
    FieldValue transactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    double? budget,
    FieldValue budgetFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String title,
    FieldValue titleFieldValue,
    String transactionType,
    FieldValue transactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    double? budget,
    FieldValue budgetFieldValue,
  });
}

class _$Sub2CategoryDocumentReference
    extends FirestoreDocumentReference<Category, Sub2CategoryDocumentSnapshot>
    implements Sub2CategoryDocumentReference {
  _$Sub2CategoryDocumentReference(this.reference);

  @override
  final DocumentReference<Category> reference;

  /// A reference to the [Sub2CategoryCollectionReference] containing this document.
  Sub2CategoryCollectionReference get parent {
    return _$Sub2CategoryCollectionReference(
      reference.parent.parent!.withConverter<Category>(
        fromFirestore: Sub1CategoryCollectionReference.fromFirestore,
        toFirestore: Sub1CategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<Sub2CategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map(Sub2CategoryDocumentSnapshot._);
  }

  @override
  Future<Sub2CategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(Sub2CategoryDocumentSnapshot._);
  }

  @override
  Future<Sub2CategoryDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(Sub2CategoryDocumentSnapshot._);
  }

  Future<void> update({
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? transactionType = _sentinel,
    FieldValue? transactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) async {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      transactionType == _sentinel || transactionTypeFieldValue == null,
      "Cannot specify both transactionType and transactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$CategoryFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$CategoryFieldMap['title']!: titleFieldValue,
      if (transactionType != _sentinel)
        _$CategoryFieldMap['transactionType']!: transactionType as String,
      if (transactionTypeFieldValue != null)
        _$CategoryFieldMap['transactionType']!: transactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$CategoryFieldMap['categoryReason']!: categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$CategoryFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (budget != _sentinel) _$CategoryFieldMap['budget']!: budget as double?,
      if (budgetFieldValue != null)
        _$CategoryFieldMap['budget']!: budgetFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? transactionType = _sentinel,
    FieldValue? transactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      transactionType == _sentinel || transactionTypeFieldValue == null,
      "Cannot specify both transactionType and transactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$CategoryFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$CategoryFieldMap['title']!: titleFieldValue,
      if (transactionType != _sentinel)
        _$CategoryFieldMap['transactionType']!: transactionType as String,
      if (transactionTypeFieldValue != null)
        _$CategoryFieldMap['transactionType']!: transactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$CategoryFieldMap['categoryReason']!: categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$CategoryFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (budget != _sentinel) _$CategoryFieldMap['budget']!: budget as double?,
      if (budgetFieldValue != null)
        _$CategoryFieldMap['budget']!: budgetFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is Sub2CategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class Sub2CategoryQuery
    implements QueryReference<Category, Sub2CategoryQuerySnapshot> {
  @override
  Sub2CategoryQuery limit(int limit);

  @override
  Sub2CategoryQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  Sub2CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  Sub2CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  Sub2CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  Sub2CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  Sub2CategoryQuery whereTransactionType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  Sub2CategoryQuery whereCategoryReason({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  Sub2CategoryQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  });

  Sub2CategoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub2CategoryQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub2CategoryQuery orderByTransactionType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub2CategoryQuery orderByCategoryReason({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  });

  Sub2CategoryQuery orderByBudget({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$Sub2CategoryQuery
    extends QueryReference<Category, Sub2CategoryQuerySnapshot>
    implements Sub2CategoryQuery {
  _$Sub2CategoryQuery(
    this._collection, {
    required Query<Category> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<Sub2CategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(Sub2CategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<Sub2CategoryQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(Sub2CategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Sub2CategoryQuery limit(int limit) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  Sub2CategoryQuery limitToLast(int limit) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  Sub2CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub2CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub2CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub2CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['title']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub2CategoryQuery whereTransactionType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['transactionType']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub2CategoryQuery whereCategoryReason({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['categoryReason']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub2CategoryQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  }) {
    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CategoryFieldMap['budget']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  Sub2CategoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub2CategoryQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CategoryFieldMap['title']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub2CategoryQuery orderByTransactionType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CategoryFieldMap['transactionType']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub2CategoryQuery orderByCategoryReason({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CategoryFieldMap['categoryReason']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  Sub2CategoryQuery orderByBudget({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Sub2CategoryDocumentSnapshot? startAtDocument,
    Sub2CategoryDocumentSnapshot? endAtDocument,
    Sub2CategoryDocumentSnapshot? endBeforeDocument,
    Sub2CategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CategoryFieldMap['budget']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$Sub2CategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$Sub2CategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class Sub2CategoryDocumentSnapshot extends FirestoreDocumentSnapshot<Category> {
  Sub2CategoryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Category> snapshot;

  @override
  Sub2CategoryDocumentReference get reference {
    return Sub2CategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Category? data;
}

class Sub2CategoryQuerySnapshot extends FirestoreQuerySnapshot<Category,
    Sub2CategoryQueryDocumentSnapshot> {
  Sub2CategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory Sub2CategoryQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Category> snapshot,
  ) {
    final docs =
        snapshot.docs.map(Sub2CategoryQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        Sub2CategoryDocumentSnapshot._,
      );
    }).toList();

    return Sub2CategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<Sub2CategoryDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    Sub2CategoryDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<Sub2CategoryDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Category> snapshot;

  @override
  final List<Sub2CategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<Sub2CategoryDocumentSnapshot>> docChanges;
}

class Sub2CategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Category>
    implements Sub2CategoryDocumentSnapshot {
  Sub2CategoryQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Category> snapshot;

  @override
  final Category data;

  @override
  Sub2CategoryDocumentReference get reference {
    return Sub2CategoryDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

void _$assertCategory(Category instance) {
  const Min(0).validate(instance.budget, 'budget');
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      uid: json['uid'] as String,
    );

const _$UserFieldMap = <String, String>{
  'id': 'id',
  'uid': 'uid',
};

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      title: json['title'] as String,
      transactionType: json['transactionType'] as String,
      categoryReason: json['categoryReason'] as String?,
      budget: (json['budget'] as num?)?.toDouble(),
    );

const _$CategoryFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'transactionType': 'transactionType',
  'categoryReason': 'categoryReason',
  'budget': 'budget',
};

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'transactionType': instance.transactionType,
      'categoryReason': instance.categoryReason,
      'budget': instance.budget,
    };
