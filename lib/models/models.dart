import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

import '../config/firestore.dart';
import '../config/keys/firestore_collections.dart';

part 'models.g.dart';

@firestoreSerializable
class User {
  User({
    required this.id,
    required this.uid,
  });

  @Id()
  final String id;
  final String uid;
}

@firestoreSerializable
class Category {
  Category({
    required this.id,
    required this.title,
    required this.transactionType,
    this.categoryReason,
    this.parentCategoryId,
    this.budget,
  }) {
    _$assertCategory(this);
  }

  @Id()
  final String id;
  final String title;
  final String transactionType;
  final String? categoryReason;
  final String? parentCategoryId;
  @Min(0)
  final double? budget;

  @override
  bool operator ==(Object other) =>
      other is Category && other.runtimeType == runtimeType && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

@firestoreSerializable
class ValueTransaction {
  ValueTransaction({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.value,
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryTransactionType,
    this.categoryReason,
  }) {
    _$assertValueTransaction(this);
  }

  @Id()
  final String id;
  final String? title;
  final DateTime dateTime;
  @Min(0)
  final double value;
  final String categoryId;
  final String categoryTitle;
  final String categoryTransactionType;
  final String? categoryReason;

  @override
  bool operator ==(Object other) =>
      other is ValueTransaction &&
      other.runtimeType == runtimeType &&
      other.id == id;

  @override
  int get hashCode => id.hashCode;
}

@Collection<User>(FirestoreCollections.users)
@Collection<ValueTransaction>(
  '${FirestoreCollections.users}/*/${FirestoreCollections.valueTransactions}',
)
@Collection<Category>(
  '${FirestoreCollections.users}/*/${FirestoreCollections.categories}',
)
final usersRef = UserCollectionReference();
