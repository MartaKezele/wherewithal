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

  late final ValueTransactionCollectionReference valueTransactions =
      _$ValueTransactionCollectionReference(
    reference,
  );

  late final CategoryCollectionReference categories =
      _$CategoryCollectionReference(
    reference,
  );

  late final BudgetCollectionReference budgets = _$BudgetCollectionReference(
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
    String? fcmToken,
    FieldValue fcmTokenFieldValue,
    int? fcmTokenTimestamp,
    FieldValue fcmTokenTimestampFieldValue,
    bool shouldSetUpData,
    FieldValue shouldSetUpDataFieldValue,
    bool recurringTransactionsNotifications,
    FieldValue recurringTransactionsNotificationsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String uid,
    FieldValue uidFieldValue,
    String? fcmToken,
    FieldValue fcmTokenFieldValue,
    int? fcmTokenTimestamp,
    FieldValue fcmTokenTimestampFieldValue,
    bool shouldSetUpData,
    FieldValue shouldSetUpDataFieldValue,
    bool recurringTransactionsNotifications,
    FieldValue recurringTransactionsNotificationsFieldValue,
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

  late final ValueTransactionCollectionReference valueTransactions =
      _$ValueTransactionCollectionReference(
    reference,
  );

  late final CategoryCollectionReference categories =
      _$CategoryCollectionReference(
    reference,
  );

  late final BudgetCollectionReference budgets = _$BudgetCollectionReference(
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
    Object? fcmToken = _sentinel,
    FieldValue? fcmTokenFieldValue,
    Object? fcmTokenTimestamp = _sentinel,
    FieldValue? fcmTokenTimestampFieldValue,
    Object? shouldSetUpData = _sentinel,
    FieldValue? shouldSetUpDataFieldValue,
    Object? recurringTransactionsNotifications = _sentinel,
    FieldValue? recurringTransactionsNotificationsFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      fcmToken == _sentinel || fcmTokenFieldValue == null,
      "Cannot specify both fcmToken and fcmTokenFieldValue",
    );
    assert(
      fcmTokenTimestamp == _sentinel || fcmTokenTimestampFieldValue == null,
      "Cannot specify both fcmTokenTimestamp and fcmTokenTimestampFieldValue",
    );
    assert(
      shouldSetUpData == _sentinel || shouldSetUpDataFieldValue == null,
      "Cannot specify both shouldSetUpData and shouldSetUpDataFieldValue",
    );
    assert(
      recurringTransactionsNotifications == _sentinel ||
          recurringTransactionsNotificationsFieldValue == null,
      "Cannot specify both recurringTransactionsNotifications and recurringTransactionsNotificationsFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$UserFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$UserFieldMap['uid']!: uidFieldValue,
      if (fcmToken != _sentinel)
        _$UserFieldMap['fcmToken']!: fcmToken as String?,
      if (fcmTokenFieldValue != null)
        _$UserFieldMap['fcmToken']!: fcmTokenFieldValue,
      if (fcmTokenTimestamp != _sentinel)
        _$UserFieldMap['fcmTokenTimestamp']!: fcmTokenTimestamp as int?,
      if (fcmTokenTimestampFieldValue != null)
        _$UserFieldMap['fcmTokenTimestamp']!: fcmTokenTimestampFieldValue,
      if (shouldSetUpData != _sentinel)
        _$UserFieldMap['shouldSetUpData']!: shouldSetUpData as bool,
      if (shouldSetUpDataFieldValue != null)
        _$UserFieldMap['shouldSetUpData']!: shouldSetUpDataFieldValue,
      if (recurringTransactionsNotifications != _sentinel)
        _$UserFieldMap['recurringTransactionsNotifications']!:
            recurringTransactionsNotifications as bool,
      if (recurringTransactionsNotificationsFieldValue != null)
        _$UserFieldMap['recurringTransactionsNotifications']!:
            recurringTransactionsNotificationsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? fcmToken = _sentinel,
    FieldValue? fcmTokenFieldValue,
    Object? fcmTokenTimestamp = _sentinel,
    FieldValue? fcmTokenTimestampFieldValue,
    Object? shouldSetUpData = _sentinel,
    FieldValue? shouldSetUpDataFieldValue,
    Object? recurringTransactionsNotifications = _sentinel,
    FieldValue? recurringTransactionsNotificationsFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      fcmToken == _sentinel || fcmTokenFieldValue == null,
      "Cannot specify both fcmToken and fcmTokenFieldValue",
    );
    assert(
      fcmTokenTimestamp == _sentinel || fcmTokenTimestampFieldValue == null,
      "Cannot specify both fcmTokenTimestamp and fcmTokenTimestampFieldValue",
    );
    assert(
      shouldSetUpData == _sentinel || shouldSetUpDataFieldValue == null,
      "Cannot specify both shouldSetUpData and shouldSetUpDataFieldValue",
    );
    assert(
      recurringTransactionsNotifications == _sentinel ||
          recurringTransactionsNotificationsFieldValue == null,
      "Cannot specify both recurringTransactionsNotifications and recurringTransactionsNotificationsFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$UserFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$UserFieldMap['uid']!: uidFieldValue,
      if (fcmToken != _sentinel)
        _$UserFieldMap['fcmToken']!: fcmToken as String?,
      if (fcmTokenFieldValue != null)
        _$UserFieldMap['fcmToken']!: fcmTokenFieldValue,
      if (fcmTokenTimestamp != _sentinel)
        _$UserFieldMap['fcmTokenTimestamp']!: fcmTokenTimestamp as int?,
      if (fcmTokenTimestampFieldValue != null)
        _$UserFieldMap['fcmTokenTimestamp']!: fcmTokenTimestampFieldValue,
      if (shouldSetUpData != _sentinel)
        _$UserFieldMap['shouldSetUpData']!: shouldSetUpData as bool,
      if (shouldSetUpDataFieldValue != null)
        _$UserFieldMap['shouldSetUpData']!: shouldSetUpDataFieldValue,
      if (recurringTransactionsNotifications != _sentinel)
        _$UserFieldMap['recurringTransactionsNotifications']!:
            recurringTransactionsNotifications as bool,
      if (recurringTransactionsNotificationsFieldValue != null)
        _$UserFieldMap['recurringTransactionsNotifications']!:
            recurringTransactionsNotificationsFieldValue,
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
  UserQuery whereFcmToken({
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
  UserQuery whereFcmTokenTimestamp({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  UserQuery whereShouldSetUpData({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  UserQuery whereRecurringTransactionsNotifications({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
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

  UserQuery orderByFcmToken({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByFcmTokenTimestamp({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByShouldSetUpData({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByRecurringTransactionsNotifications({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
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

  UserQuery whereFcmToken({
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
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['fcmToken']!,
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

  UserQuery whereFcmTokenTimestamp({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['fcmTokenTimestamp']!,
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

  UserQuery whereShouldSetUpData({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['shouldSetUpData']!,
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

  UserQuery whereRecurringTransactionsNotifications({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['recurringTransactionsNotifications']!,
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

  UserQuery orderByFcmToken({
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
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['fcmToken']!,
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

  UserQuery orderByFcmTokenTimestamp({
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserFieldMap['fcmTokenTimestamp']!, descending: descending);
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

  UserQuery orderByShouldSetUpData({
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserFieldMap['shouldSetUpData']!, descending: descending);
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

  UserQuery orderByRecurringTransactionsNotifications({
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
    final query = $referenceWithoutCursor.orderBy(
        _$UserFieldMap['recurringTransactionsNotifications']!,
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
abstract class ValueTransactionCollectionReference
    implements
        ValueTransactionQuery,
        FirestoreCollectionReference<ValueTransaction,
            ValueTransactionQuerySnapshot> {
  factory ValueTransactionCollectionReference(
    DocumentReference<User> parent,
  ) = _$ValueTransactionCollectionReference;

  static ValueTransaction fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ValueTransaction.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    ValueTransaction value,
    SetOptions? options,
  ) {
    return {..._$ValueTransactionToJson(value)}..remove('id');
  }

  @override
  CollectionReference<ValueTransaction> get reference;

  /// A reference to the containing [UserDocumentReference] if this is a subcollection.
  UserDocumentReference get parent;

  @override
  ValueTransactionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ValueTransactionDocumentReference> add(ValueTransaction value);
}

class _$ValueTransactionCollectionReference extends _$ValueTransactionQuery
    implements ValueTransactionCollectionReference {
  factory _$ValueTransactionCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$ValueTransactionCollectionReference._(
      UserDocumentReference(parent),
      parent.collection('valueTransactions').withConverter(
            fromFirestore: ValueTransactionCollectionReference.fromFirestore,
            toFirestore: ValueTransactionCollectionReference.toFirestore,
          ),
    );
  }

  _$ValueTransactionCollectionReference._(
    this.parent,
    CollectionReference<ValueTransaction> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<ValueTransaction> get reference =>
      super.reference as CollectionReference<ValueTransaction>;

  @override
  ValueTransactionDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ValueTransactionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ValueTransactionDocumentReference> add(ValueTransaction value) {
    return reference
        .add(value)
        .then((ref) => ValueTransactionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ValueTransactionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ValueTransactionDocumentReference
    extends FirestoreDocumentReference<ValueTransaction,
        ValueTransactionDocumentSnapshot> {
  factory ValueTransactionDocumentReference(
          DocumentReference<ValueTransaction> reference) =
      _$ValueTransactionDocumentReference;

  DocumentReference<ValueTransaction> get reference;

  /// A reference to the [ValueTransactionCollectionReference] containing this document.
  ValueTransactionCollectionReference get parent {
    return _$ValueTransactionCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ValueTransactionDocumentSnapshot> snapshots();

  @override
  Future<ValueTransactionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? title,
    FieldValue titleFieldValue,
    DateTime dateTime,
    FieldValue dateTimeFieldValue,
    double value,
    FieldValue valueFieldValue,
    String categoryId,
    FieldValue categoryIdFieldValue,
    String categoryTitle,
    FieldValue categoryTitleFieldValue,
    String categoryTransactionType,
    FieldValue categoryTransactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    String? parentCategoryId,
    FieldValue parentCategoryIdFieldValue,
    String? cronExpression,
    FieldValue cronExpressionFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? title,
    FieldValue titleFieldValue,
    DateTime dateTime,
    FieldValue dateTimeFieldValue,
    double value,
    FieldValue valueFieldValue,
    String categoryId,
    FieldValue categoryIdFieldValue,
    String categoryTitle,
    FieldValue categoryTitleFieldValue,
    String categoryTransactionType,
    FieldValue categoryTransactionTypeFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    String? parentCategoryId,
    FieldValue parentCategoryIdFieldValue,
    String? cronExpression,
    FieldValue cronExpressionFieldValue,
  });
}

class _$ValueTransactionDocumentReference extends FirestoreDocumentReference<
        ValueTransaction, ValueTransactionDocumentSnapshot>
    implements ValueTransactionDocumentReference {
  _$ValueTransactionDocumentReference(this.reference);

  @override
  final DocumentReference<ValueTransaction> reference;

  /// A reference to the [ValueTransactionCollectionReference] containing this document.
  ValueTransactionCollectionReference get parent {
    return _$ValueTransactionCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ValueTransactionDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ValueTransactionDocumentSnapshot._);
  }

  @override
  Future<ValueTransactionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ValueTransactionDocumentSnapshot._);
  }

  @override
  Future<ValueTransactionDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(ValueTransactionDocumentSnapshot._);
  }

  Future<void> update({
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? dateTime = _sentinel,
    FieldValue? dateTimeFieldValue,
    Object? value = _sentinel,
    FieldValue? valueFieldValue,
    Object? categoryId = _sentinel,
    FieldValue? categoryIdFieldValue,
    Object? categoryTitle = _sentinel,
    FieldValue? categoryTitleFieldValue,
    Object? categoryTransactionType = _sentinel,
    FieldValue? categoryTransactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? parentCategoryId = _sentinel,
    FieldValue? parentCategoryIdFieldValue,
    Object? cronExpression = _sentinel,
    FieldValue? cronExpressionFieldValue,
  }) async {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      dateTime == _sentinel || dateTimeFieldValue == null,
      "Cannot specify both dateTime and dateTimeFieldValue",
    );
    assert(
      value == _sentinel || valueFieldValue == null,
      "Cannot specify both value and valueFieldValue",
    );
    assert(
      categoryId == _sentinel || categoryIdFieldValue == null,
      "Cannot specify both categoryId and categoryIdFieldValue",
    );
    assert(
      categoryTitle == _sentinel || categoryTitleFieldValue == null,
      "Cannot specify both categoryTitle and categoryTitleFieldValue",
    );
    assert(
      categoryTransactionType == _sentinel ||
          categoryTransactionTypeFieldValue == null,
      "Cannot specify both categoryTransactionType and categoryTransactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      parentCategoryId == _sentinel || parentCategoryIdFieldValue == null,
      "Cannot specify both parentCategoryId and parentCategoryIdFieldValue",
    );
    assert(
      cronExpression == _sentinel || cronExpressionFieldValue == null,
      "Cannot specify both cronExpression and cronExpressionFieldValue",
    );
    final json = {
      if (title != _sentinel)
        _$ValueTransactionFieldMap['title']!: title as String?,
      if (titleFieldValue != null)
        _$ValueTransactionFieldMap['title']!: titleFieldValue,
      if (dateTime != _sentinel)
        _$ValueTransactionFieldMap['dateTime']!: dateTime as DateTime,
      if (dateTimeFieldValue != null)
        _$ValueTransactionFieldMap['dateTime']!: dateTimeFieldValue,
      if (value != _sentinel)
        _$ValueTransactionFieldMap['value']!: value as double,
      if (valueFieldValue != null)
        _$ValueTransactionFieldMap['value']!: valueFieldValue,
      if (categoryId != _sentinel)
        _$ValueTransactionFieldMap['categoryId']!: categoryId as String,
      if (categoryIdFieldValue != null)
        _$ValueTransactionFieldMap['categoryId']!: categoryIdFieldValue,
      if (categoryTitle != _sentinel)
        _$ValueTransactionFieldMap['categoryTitle']!: categoryTitle as String,
      if (categoryTitleFieldValue != null)
        _$ValueTransactionFieldMap['categoryTitle']!: categoryTitleFieldValue,
      if (categoryTransactionType != _sentinel)
        _$ValueTransactionFieldMap['categoryTransactionType']!:
            categoryTransactionType as String,
      if (categoryTransactionTypeFieldValue != null)
        _$ValueTransactionFieldMap['categoryTransactionType']!:
            categoryTransactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$ValueTransactionFieldMap['categoryReason']!:
            categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$ValueTransactionFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (parentCategoryId != _sentinel)
        _$ValueTransactionFieldMap['parentCategoryId']!:
            parentCategoryId as String?,
      if (parentCategoryIdFieldValue != null)
        _$ValueTransactionFieldMap['parentCategoryId']!:
            parentCategoryIdFieldValue,
      if (cronExpression != _sentinel)
        _$ValueTransactionFieldMap['cronExpression']!:
            cronExpression as String?,
      if (cronExpressionFieldValue != null)
        _$ValueTransactionFieldMap['cronExpression']!: cronExpressionFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? dateTime = _sentinel,
    FieldValue? dateTimeFieldValue,
    Object? value = _sentinel,
    FieldValue? valueFieldValue,
    Object? categoryId = _sentinel,
    FieldValue? categoryIdFieldValue,
    Object? categoryTitle = _sentinel,
    FieldValue? categoryTitleFieldValue,
    Object? categoryTransactionType = _sentinel,
    FieldValue? categoryTransactionTypeFieldValue,
    Object? categoryReason = _sentinel,
    FieldValue? categoryReasonFieldValue,
    Object? parentCategoryId = _sentinel,
    FieldValue? parentCategoryIdFieldValue,
    Object? cronExpression = _sentinel,
    FieldValue? cronExpressionFieldValue,
  }) {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      dateTime == _sentinel || dateTimeFieldValue == null,
      "Cannot specify both dateTime and dateTimeFieldValue",
    );
    assert(
      value == _sentinel || valueFieldValue == null,
      "Cannot specify both value and valueFieldValue",
    );
    assert(
      categoryId == _sentinel || categoryIdFieldValue == null,
      "Cannot specify both categoryId and categoryIdFieldValue",
    );
    assert(
      categoryTitle == _sentinel || categoryTitleFieldValue == null,
      "Cannot specify both categoryTitle and categoryTitleFieldValue",
    );
    assert(
      categoryTransactionType == _sentinel ||
          categoryTransactionTypeFieldValue == null,
      "Cannot specify both categoryTransactionType and categoryTransactionTypeFieldValue",
    );
    assert(
      categoryReason == _sentinel || categoryReasonFieldValue == null,
      "Cannot specify both categoryReason and categoryReasonFieldValue",
    );
    assert(
      parentCategoryId == _sentinel || parentCategoryIdFieldValue == null,
      "Cannot specify both parentCategoryId and parentCategoryIdFieldValue",
    );
    assert(
      cronExpression == _sentinel || cronExpressionFieldValue == null,
      "Cannot specify both cronExpression and cronExpressionFieldValue",
    );
    final json = {
      if (title != _sentinel)
        _$ValueTransactionFieldMap['title']!: title as String?,
      if (titleFieldValue != null)
        _$ValueTransactionFieldMap['title']!: titleFieldValue,
      if (dateTime != _sentinel)
        _$ValueTransactionFieldMap['dateTime']!: dateTime as DateTime,
      if (dateTimeFieldValue != null)
        _$ValueTransactionFieldMap['dateTime']!: dateTimeFieldValue,
      if (value != _sentinel)
        _$ValueTransactionFieldMap['value']!: value as double,
      if (valueFieldValue != null)
        _$ValueTransactionFieldMap['value']!: valueFieldValue,
      if (categoryId != _sentinel)
        _$ValueTransactionFieldMap['categoryId']!: categoryId as String,
      if (categoryIdFieldValue != null)
        _$ValueTransactionFieldMap['categoryId']!: categoryIdFieldValue,
      if (categoryTitle != _sentinel)
        _$ValueTransactionFieldMap['categoryTitle']!: categoryTitle as String,
      if (categoryTitleFieldValue != null)
        _$ValueTransactionFieldMap['categoryTitle']!: categoryTitleFieldValue,
      if (categoryTransactionType != _sentinel)
        _$ValueTransactionFieldMap['categoryTransactionType']!:
            categoryTransactionType as String,
      if (categoryTransactionTypeFieldValue != null)
        _$ValueTransactionFieldMap['categoryTransactionType']!:
            categoryTransactionTypeFieldValue,
      if (categoryReason != _sentinel)
        _$ValueTransactionFieldMap['categoryReason']!:
            categoryReason as String?,
      if (categoryReasonFieldValue != null)
        _$ValueTransactionFieldMap['categoryReason']!: categoryReasonFieldValue,
      if (parentCategoryId != _sentinel)
        _$ValueTransactionFieldMap['parentCategoryId']!:
            parentCategoryId as String?,
      if (parentCategoryIdFieldValue != null)
        _$ValueTransactionFieldMap['parentCategoryId']!:
            parentCategoryIdFieldValue,
      if (cronExpression != _sentinel)
        _$ValueTransactionFieldMap['cronExpression']!:
            cronExpression as String?,
      if (cronExpressionFieldValue != null)
        _$ValueTransactionFieldMap['cronExpression']!: cronExpressionFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ValueTransactionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ValueTransactionQuery
    implements QueryReference<ValueTransaction, ValueTransactionQuerySnapshot> {
  @override
  ValueTransactionQuery limit(int limit);

  @override
  ValueTransactionQuery limitToLast(int limit);

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
  ValueTransactionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
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
  ValueTransactionQuery whereFieldPath(
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

  ValueTransactionQuery whereDocumentId({
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
  ValueTransactionQuery whereTitle({
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
  ValueTransactionQuery whereDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  ValueTransactionQuery whereValue({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  ValueTransactionQuery whereCategoryId({
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
  ValueTransactionQuery whereCategoryTitle({
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
  ValueTransactionQuery whereCategoryTransactionType({
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
  ValueTransactionQuery whereCategoryReason({
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
  ValueTransactionQuery whereParentCategoryId({
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
  ValueTransactionQuery whereCronExpression({
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

  ValueTransactionQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByTitle({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByDateTime({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByValue({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByCategoryId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByCategoryTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByCategoryTransactionType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByCategoryReason({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByParentCategoryId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });

  ValueTransactionQuery orderByCronExpression({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  });
}

class _$ValueTransactionQuery
    extends QueryReference<ValueTransaction, ValueTransactionQuerySnapshot>
    implements ValueTransactionQuery {
  _$ValueTransactionQuery(
    this._collection, {
    required Query<ValueTransaction> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ValueTransactionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(ValueTransactionQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ValueTransactionQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(ValueTransactionQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ValueTransactionQuery limit(int limit) {
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ValueTransactionQuery limitToLast(int limit) {
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  ValueTransactionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery whereFieldPath(
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
    return _$ValueTransactionQuery(
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

  ValueTransactionQuery whereDocumentId({
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
    return _$ValueTransactionQuery(
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

  ValueTransactionQuery whereTitle({
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['title']!,
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

  ValueTransactionQuery whereDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['dateTime']!,
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

  ValueTransactionQuery whereValue({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['value']!,
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

  ValueTransactionQuery whereCategoryId({
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['categoryId']!,
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

  ValueTransactionQuery whereCategoryTitle({
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['categoryTitle']!,
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

  ValueTransactionQuery whereCategoryTransactionType({
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['categoryTransactionType']!,
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

  ValueTransactionQuery whereCategoryReason({
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['categoryReason']!,
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

  ValueTransactionQuery whereParentCategoryId({
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['parentCategoryId']!,
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

  ValueTransactionQuery whereCronExpression({
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
    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ValueTransactionFieldMap['cronExpression']!,
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

  ValueTransactionQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ValueTransactionFieldMap['title']!, descending: descending);
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByDateTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ValueTransactionFieldMap['dateTime']!,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByValue({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ValueTransactionFieldMap['value']!, descending: descending);
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByCategoryId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ValueTransactionFieldMap['categoryId']!,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByCategoryTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ValueTransactionFieldMap['categoryTitle']!,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByCategoryTransactionType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ValueTransactionFieldMap['categoryTransactionType']!,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByCategoryReason({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ValueTransactionFieldMap['categoryReason']!,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByParentCategoryId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ValueTransactionFieldMap['parentCategoryId']!,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ValueTransactionQuery orderByCronExpression({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ValueTransactionDocumentSnapshot? startAtDocument,
    ValueTransactionDocumentSnapshot? endAtDocument,
    ValueTransactionDocumentSnapshot? endBeforeDocument,
    ValueTransactionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ValueTransactionFieldMap['cronExpression']!,
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

    return _$ValueTransactionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ValueTransactionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ValueTransactionDocumentSnapshot
    extends FirestoreDocumentSnapshot<ValueTransaction> {
  ValueTransactionDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<ValueTransaction> snapshot;

  @override
  ValueTransactionDocumentReference get reference {
    return ValueTransactionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ValueTransaction? data;
}

class ValueTransactionQuerySnapshot extends FirestoreQuerySnapshot<
    ValueTransaction, ValueTransactionQueryDocumentSnapshot> {
  ValueTransactionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ValueTransactionQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<ValueTransaction> snapshot,
  ) {
    final docs =
        snapshot.docs.map(ValueTransactionQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ValueTransactionDocumentSnapshot._,
      );
    }).toList();

    return ValueTransactionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ValueTransactionDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ValueTransactionDocumentSnapshot Function(DocumentSnapshot<T> doc)
        decodeDoc,
  ) {
    return FirestoreDocumentChange<ValueTransactionDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<ValueTransaction> snapshot;

  @override
  final List<ValueTransactionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ValueTransactionDocumentSnapshot>>
      docChanges;
}

class ValueTransactionQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<ValueTransaction>
    implements ValueTransactionDocumentSnapshot {
  ValueTransactionQueryDocumentSnapshot._(this.snapshot)
      : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<ValueTransaction> snapshot;

  @override
  final ValueTransaction data;

  @override
  ValueTransactionDocumentReference get reference {
    return ValueTransactionDocumentReference(snapshot.reference);
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
    String? parentCategoryId,
    FieldValue parentCategoryIdFieldValue,
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
    String? parentCategoryId,
    FieldValue parentCategoryIdFieldValue,
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
    Object? parentCategoryId = _sentinel,
    FieldValue? parentCategoryIdFieldValue,
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
      parentCategoryId == _sentinel || parentCategoryIdFieldValue == null,
      "Cannot specify both parentCategoryId and parentCategoryIdFieldValue",
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
      if (parentCategoryId != _sentinel)
        _$CategoryFieldMap['parentCategoryId']!: parentCategoryId as String?,
      if (parentCategoryIdFieldValue != null)
        _$CategoryFieldMap['parentCategoryId']!: parentCategoryIdFieldValue,
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
    Object? parentCategoryId = _sentinel,
    FieldValue? parentCategoryIdFieldValue,
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
      parentCategoryId == _sentinel || parentCategoryIdFieldValue == null,
      "Cannot specify both parentCategoryId and parentCategoryIdFieldValue",
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
      if (parentCategoryId != _sentinel)
        _$CategoryFieldMap['parentCategoryId']!: parentCategoryId as String?,
      if (parentCategoryIdFieldValue != null)
        _$CategoryFieldMap['parentCategoryId']!: parentCategoryIdFieldValue,
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
  CategoryQuery whereParentCategoryId({
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

  CategoryQuery orderByParentCategoryId({
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

  CategoryQuery whereParentCategoryId({
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
        _$CategoryFieldMap['parentCategoryId']!,
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

  CategoryQuery orderByParentCategoryId({
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
        _$CategoryFieldMap['parentCategoryId']!,
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
abstract class BudgetCollectionReference
    implements
        BudgetQuery,
        FirestoreCollectionReference<Budget, BudgetQuerySnapshot> {
  factory BudgetCollectionReference(
    DocumentReference<User> parent,
  ) = _$BudgetCollectionReference;

  static Budget fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$BudgetFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Budget value,
    SetOptions? options,
  ) {
    return {..._$BudgetToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Budget> get reference;

  /// A reference to the containing [UserDocumentReference] if this is a subcollection.
  UserDocumentReference get parent;

  @override
  BudgetDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<BudgetDocumentReference> add(Budget value);
}

class _$BudgetCollectionReference extends _$BudgetQuery
    implements BudgetCollectionReference {
  factory _$BudgetCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$BudgetCollectionReference._(
      UserDocumentReference(parent),
      parent.collection('budgets').withConverter(
            fromFirestore: BudgetCollectionReference.fromFirestore,
            toFirestore: BudgetCollectionReference.toFirestore,
          ),
    );
  }

  _$BudgetCollectionReference._(
    this.parent,
    CollectionReference<Budget> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Budget> get reference =>
      super.reference as CollectionReference<Budget>;

  @override
  BudgetDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return BudgetDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<BudgetDocumentReference> add(Budget value) {
    return reference.add(value).then((ref) => BudgetDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$BudgetCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class BudgetDocumentReference
    extends FirestoreDocumentReference<Budget, BudgetDocumentSnapshot> {
  factory BudgetDocumentReference(DocumentReference<Budget> reference) =
      _$BudgetDocumentReference;

  DocumentReference<Budget> get reference;

  /// A reference to the [BudgetCollectionReference] containing this document.
  BudgetCollectionReference get parent {
    return _$BudgetCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<BudgetDocumentSnapshot> snapshots();

  @override
  Future<BudgetDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String title,
    FieldValue titleFieldValue,
    List<String> categoryIds,
    FieldValue categoryIdsFieldValue,
    String? cronExpression,
    FieldValue cronExpressionFieldValue,
    DateTime? startDateTime,
    FieldValue startDateTimeFieldValue,
    DateTime? endDateTime,
    FieldValue endDateTimeFieldValue,
    double budget,
    FieldValue budgetFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String title,
    FieldValue titleFieldValue,
    List<String> categoryIds,
    FieldValue categoryIdsFieldValue,
    String? cronExpression,
    FieldValue cronExpressionFieldValue,
    DateTime? startDateTime,
    FieldValue startDateTimeFieldValue,
    DateTime? endDateTime,
    FieldValue endDateTimeFieldValue,
    double budget,
    FieldValue budgetFieldValue,
  });
}

class _$BudgetDocumentReference
    extends FirestoreDocumentReference<Budget, BudgetDocumentSnapshot>
    implements BudgetDocumentReference {
  _$BudgetDocumentReference(this.reference);

  @override
  final DocumentReference<Budget> reference;

  /// A reference to the [BudgetCollectionReference] containing this document.
  BudgetCollectionReference get parent {
    return _$BudgetCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<BudgetDocumentSnapshot> snapshots() {
    return reference.snapshots().map(BudgetDocumentSnapshot._);
  }

  @override
  Future<BudgetDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(BudgetDocumentSnapshot._);
  }

  @override
  Future<BudgetDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(BudgetDocumentSnapshot._);
  }

  Future<void> update({
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? categoryIds = _sentinel,
    FieldValue? categoryIdsFieldValue,
    Object? cronExpression = _sentinel,
    FieldValue? cronExpressionFieldValue,
    Object? startDateTime = _sentinel,
    FieldValue? startDateTimeFieldValue,
    Object? endDateTime = _sentinel,
    FieldValue? endDateTimeFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) async {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      categoryIds == _sentinel || categoryIdsFieldValue == null,
      "Cannot specify both categoryIds and categoryIdsFieldValue",
    );
    assert(
      cronExpression == _sentinel || cronExpressionFieldValue == null,
      "Cannot specify both cronExpression and cronExpressionFieldValue",
    );
    assert(
      startDateTime == _sentinel || startDateTimeFieldValue == null,
      "Cannot specify both startDateTime and startDateTimeFieldValue",
    );
    assert(
      endDateTime == _sentinel || endDateTimeFieldValue == null,
      "Cannot specify both endDateTime and endDateTimeFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$BudgetFieldMap['title']!: title as String,
      if (titleFieldValue != null) _$BudgetFieldMap['title']!: titleFieldValue,
      if (categoryIds != _sentinel)
        _$BudgetFieldMap['categoryIds']!: categoryIds as List<String>,
      if (categoryIdsFieldValue != null)
        _$BudgetFieldMap['categoryIds']!: categoryIdsFieldValue,
      if (cronExpression != _sentinel)
        _$BudgetFieldMap['cronExpression']!: cronExpression as String?,
      if (cronExpressionFieldValue != null)
        _$BudgetFieldMap['cronExpression']!: cronExpressionFieldValue,
      if (startDateTime != _sentinel)
        _$BudgetFieldMap['startDateTime']!: startDateTime as DateTime?,
      if (startDateTimeFieldValue != null)
        _$BudgetFieldMap['startDateTime']!: startDateTimeFieldValue,
      if (endDateTime != _sentinel)
        _$BudgetFieldMap['endDateTime']!: endDateTime as DateTime?,
      if (endDateTimeFieldValue != null)
        _$BudgetFieldMap['endDateTime']!: endDateTimeFieldValue,
      if (budget != _sentinel) _$BudgetFieldMap['budget']!: budget as double,
      if (budgetFieldValue != null)
        _$BudgetFieldMap['budget']!: budgetFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? categoryIds = _sentinel,
    FieldValue? categoryIdsFieldValue,
    Object? cronExpression = _sentinel,
    FieldValue? cronExpressionFieldValue,
    Object? startDateTime = _sentinel,
    FieldValue? startDateTimeFieldValue,
    Object? endDateTime = _sentinel,
    FieldValue? endDateTimeFieldValue,
    Object? budget = _sentinel,
    FieldValue? budgetFieldValue,
  }) {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      categoryIds == _sentinel || categoryIdsFieldValue == null,
      "Cannot specify both categoryIds and categoryIdsFieldValue",
    );
    assert(
      cronExpression == _sentinel || cronExpressionFieldValue == null,
      "Cannot specify both cronExpression and cronExpressionFieldValue",
    );
    assert(
      startDateTime == _sentinel || startDateTimeFieldValue == null,
      "Cannot specify both startDateTime and startDateTimeFieldValue",
    );
    assert(
      endDateTime == _sentinel || endDateTimeFieldValue == null,
      "Cannot specify both endDateTime and endDateTimeFieldValue",
    );
    assert(
      budget == _sentinel || budgetFieldValue == null,
      "Cannot specify both budget and budgetFieldValue",
    );
    final json = {
      if (title != _sentinel) _$BudgetFieldMap['title']!: title as String,
      if (titleFieldValue != null) _$BudgetFieldMap['title']!: titleFieldValue,
      if (categoryIds != _sentinel)
        _$BudgetFieldMap['categoryIds']!: categoryIds as List<String>,
      if (categoryIdsFieldValue != null)
        _$BudgetFieldMap['categoryIds']!: categoryIdsFieldValue,
      if (cronExpression != _sentinel)
        _$BudgetFieldMap['cronExpression']!: cronExpression as String?,
      if (cronExpressionFieldValue != null)
        _$BudgetFieldMap['cronExpression']!: cronExpressionFieldValue,
      if (startDateTime != _sentinel)
        _$BudgetFieldMap['startDateTime']!: startDateTime as DateTime?,
      if (startDateTimeFieldValue != null)
        _$BudgetFieldMap['startDateTime']!: startDateTimeFieldValue,
      if (endDateTime != _sentinel)
        _$BudgetFieldMap['endDateTime']!: endDateTime as DateTime?,
      if (endDateTimeFieldValue != null)
        _$BudgetFieldMap['endDateTime']!: endDateTimeFieldValue,
      if (budget != _sentinel) _$BudgetFieldMap['budget']!: budget as double,
      if (budgetFieldValue != null)
        _$BudgetFieldMap['budget']!: budgetFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is BudgetDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class BudgetQuery
    implements QueryReference<Budget, BudgetQuerySnapshot> {
  @override
  BudgetQuery limit(int limit);

  @override
  BudgetQuery limitToLast(int limit);

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
  BudgetQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
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
  BudgetQuery whereFieldPath(
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

  BudgetQuery whereDocumentId({
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
  BudgetQuery whereTitle({
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
  BudgetQuery whereCategoryIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });
  BudgetQuery whereCronExpression({
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
  BudgetQuery whereStartDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  BudgetQuery whereEndDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  BudgetQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });

  BudgetQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  });

  BudgetQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  });

  BudgetQuery orderByCategoryIds({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  });

  BudgetQuery orderByCronExpression({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  });

  BudgetQuery orderByStartDateTime({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  });

  BudgetQuery orderByEndDateTime({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  });

  BudgetQuery orderByBudget({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  });
}

class _$BudgetQuery extends QueryReference<Budget, BudgetQuerySnapshot>
    implements BudgetQuery {
  _$BudgetQuery(
    this._collection, {
    required Query<Budget> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<BudgetQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(BudgetQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<BudgetQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(BudgetQuerySnapshot._fromQuerySnapshot);
  }

  @override
  BudgetQuery limit(int limit) {
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  BudgetQuery limitToLast(int limit) {
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  BudgetQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
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
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BudgetQuery whereFieldPath(
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
    return _$BudgetQuery(
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

  BudgetQuery whereDocumentId({
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
    return _$BudgetQuery(
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

  BudgetQuery whereTitle({
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
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BudgetFieldMap['title']!,
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

  BudgetQuery whereCategoryIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BudgetFieldMap['categoryIds']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  BudgetQuery whereCronExpression({
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
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BudgetFieldMap['cronExpression']!,
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

  BudgetQuery whereStartDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BudgetFieldMap['startDateTime']!,
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

  BudgetQuery whereEndDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BudgetFieldMap['endDateTime']!,
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

  BudgetQuery whereBudget({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BudgetFieldMap['budget']!,
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

  BudgetQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
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

    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BudgetQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$BudgetFieldMap['title']!,
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

    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BudgetQuery orderByCategoryIds({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$BudgetFieldMap['categoryIds']!, descending: descending);
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

    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BudgetQuery orderByCronExpression({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$BudgetFieldMap['cronExpression']!, descending: descending);
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

    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BudgetQuery orderByStartDateTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$BudgetFieldMap['startDateTime']!, descending: descending);
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

    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BudgetQuery orderByEndDateTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$BudgetFieldMap['endDateTime']!, descending: descending);
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

    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BudgetQuery orderByBudget({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BudgetDocumentSnapshot? startAtDocument,
    BudgetDocumentSnapshot? endAtDocument,
    BudgetDocumentSnapshot? endBeforeDocument,
    BudgetDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$BudgetFieldMap['budget']!,
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

    return _$BudgetQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$BudgetQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class BudgetDocumentSnapshot extends FirestoreDocumentSnapshot<Budget> {
  BudgetDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Budget> snapshot;

  @override
  BudgetDocumentReference get reference {
    return BudgetDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Budget? data;
}

class BudgetQuerySnapshot
    extends FirestoreQuerySnapshot<Budget, BudgetQueryDocumentSnapshot> {
  BudgetQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory BudgetQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Budget> snapshot,
  ) {
    final docs = snapshot.docs.map(BudgetQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        BudgetDocumentSnapshot._,
      );
    }).toList();

    return BudgetQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<BudgetDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    BudgetDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<BudgetDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Budget> snapshot;

  @override
  final List<BudgetQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<BudgetDocumentSnapshot>> docChanges;
}

class BudgetQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Budget>
    implements BudgetDocumentSnapshot {
  BudgetQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Budget> snapshot;

  @override
  final Budget data;

  @override
  BudgetDocumentReference get reference {
    return BudgetDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

void _$assertBudget(Budget instance) {
  const Min(0).validate(instance.budget, 'budget');
}

void _$assertValueTransaction(ValueTransaction instance) {
  const Min(0).validate(instance.value, 'value');
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      uid: json['uid'] as String,
      fcmToken: json['fcmToken'] as String?,
      fcmTokenTimestamp: json['fcmTokenTimestamp'] as int?,
      shouldSetUpData: json['shouldSetUpData'] as bool? ?? true,
      recurringTransactionsNotifications:
          json['recurringTransactionsNotifications'] as bool? ?? true,
    );

const _$UserFieldMap = <String, String>{
  'id': 'id',
  'uid': 'uid',
  'fcmToken': 'fcmToken',
  'fcmTokenTimestamp': 'fcmTokenTimestamp',
  'shouldSetUpData': 'shouldSetUpData',
  'recurringTransactionsNotifications': 'recurringTransactionsNotifications',
};

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'fcmToken': instance.fcmToken,
      'fcmTokenTimestamp': instance.fcmTokenTimestamp,
      'shouldSetUpData': instance.shouldSetUpData,
      'recurringTransactionsNotifications':
          instance.recurringTransactionsNotifications,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      title: json['title'] as String,
      transactionType: json['transactionType'] as String,
      categoryReason: json['categoryReason'] as String?,
      parentCategoryId: json['parentCategoryId'] as String?,
    );

const _$CategoryFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'transactionType': 'transactionType',
  'categoryReason': 'categoryReason',
  'parentCategoryId': 'parentCategoryId',
};

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'transactionType': instance.transactionType,
      'categoryReason': instance.categoryReason,
      'parentCategoryId': instance.parentCategoryId,
    };

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
      id: json['id'] as String,
      title: json['title'] as String,
      categoryIds: (json['categoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cronExpression: json['cronExpression'] as String?,
      startDateTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startDateTime'], const FirestoreDateTimeConverter().fromJson),
      endDateTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endDateTime'], const FirestoreDateTimeConverter().fromJson),
      budget: (json['budget'] as num).toDouble(),
    );

const _$BudgetFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'categoryIds': 'categoryIds',
  'cronExpression': 'cronExpression',
  'startDateTime': 'startDateTime',
  'endDateTime': 'endDateTime',
  'budget': 'budget',
};

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categoryIds': instance.categoryIds,
      'cronExpression': instance.cronExpression,
      'startDateTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startDateTime, const FirestoreDateTimeConverter().toJson),
      'endDateTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endDateTime, const FirestoreDateTimeConverter().toJson),
      'budget': instance.budget,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

ValueTransaction _$ValueTransactionFromJson(Map<String, dynamic> json) =>
    ValueTransaction(
      id: json['id'] as String,
      title: json['title'] as String?,
      dateTime: const FirestoreDateTimeConverter()
          .fromJson(json['dateTime'] as Timestamp),
      value: (json['value'] as num).toDouble(),
      categoryId: json['categoryId'] as String,
      categoryTitle: json['categoryTitle'] as String,
      categoryTransactionType: json['categoryTransactionType'] as String,
      categoryReason: json['categoryReason'] as String?,
      parentCategoryId: json['parentCategoryId'] as String?,
      cronExpression: json['cronExpression'] as String?,
    );

const _$ValueTransactionFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'dateTime': 'dateTime',
  'value': 'value',
  'categoryId': 'categoryId',
  'categoryTitle': 'categoryTitle',
  'categoryTransactionType': 'categoryTransactionType',
  'categoryReason': 'categoryReason',
  'parentCategoryId': 'parentCategoryId',
  'cronExpression': 'cronExpression',
};

Map<String, dynamic> _$ValueTransactionToJson(ValueTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dateTime': const FirestoreDateTimeConverter().toJson(instance.dateTime),
      'value': instance.value,
      'categoryId': instance.categoryId,
      'categoryTitle': instance.categoryTitle,
      'categoryTransactionType': instance.categoryTransactionType,
      'categoryReason': instance.categoryReason,
      'parentCategoryId': instance.parentCategoryId,
      'cronExpression': instance.cronExpression,
    };
