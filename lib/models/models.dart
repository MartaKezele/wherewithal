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
    this.budget,
  }) {
    _$assertCategory(this);
  }

  @Id()
  final String id;
  final String title;
  final String transactionType;
  final String? categoryReason;
  @Min(0)
  final double? budget;
}

@Collection<User>(FirestoreCollections.users)
@Collection<Category>(
  '${FirestoreCollections.users}/*/${FirestoreCollections.categories}',
)
@Collection<Category>(
  '${FirestoreCollections.users}/*/${FirestoreCollections.categories}/*/${FirestoreCollections.subcategories}',
  prefix: 'Sub1Category',
)
@Collection<Category>(
  '${FirestoreCollections.users}/*/${FirestoreCollections.categories}/*/${FirestoreCollections.subcategories}/*/${FirestoreCollections.subcategories}',
  prefix: 'Sub2Category',
)
final usersRef = UserCollectionReference();
