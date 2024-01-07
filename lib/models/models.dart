import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

import '../config/firestore.dart';
import '../config/keys/firestore_collections.dart';

part 'models.g.dart';

@firestoreSerializable
class User {
  User({
    required this.id,
    this.fcmToken,
    this.fcmTokenTimestamp,
    this.shouldSetUpCategories = true,
    this.recurringTransactionsNotifications = true,
  });

  @Id()
  final String id;
  final String? fcmToken;
  final int? fcmTokenTimestamp;
  final bool shouldSetUpCategories;
  final bool recurringTransactionsNotifications;
}

@firestoreSerializable
class Category {
  Category({
    required this.id,
    required this.title,
    required this.transactionType,
    this.categoryReason,
    this.parentCategoryId,
  });

  @Id()
  final String id;
  final String title;
  final String transactionType;
  final String? categoryReason;
  final String? parentCategoryId;

  @override
  bool operator ==(Object other) =>
      other is Category && other.runtimeType == runtimeType && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

@firestoreSerializable
class Budget {
  Budget({
    required this.id,
    required this.title,
    required this.categoryIds,
    this.cronExpression,
    this.startDateTime,
    this.endDateTime,
    required this.budget,
  }) {
    _$assertBudget(this);
  }

  @Id()
  final String id;
  final String title;
  final List<String> categoryIds;
  final String? cronExpression;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  @Min(0)
  final double budget;

  @override
  bool operator ==(Object other) =>
      other is Budget && other.runtimeType == runtimeType && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

@firestoreSerializable
class ValueTransaction {
  ValueTransaction({
    required this.id,
    this.title,
    required this.dateTime,
    required this.value,
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryTransactionType,
    this.categoryReason,
    this.parentCategoryId,
    this.cronExpression,
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
  final String? parentCategoryId;
  final String? cronExpression;

  factory ValueTransaction.fromJson(Map<String, dynamic> json) {
    return ValueTransaction(
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
  }

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
@Collection<Budget>(
  '${FirestoreCollections.users}/*/${FirestoreCollections.budgets}',
)
final usersRef = UserCollectionReference();
