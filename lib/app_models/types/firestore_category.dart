import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

import '../../models/models.dart' as models;

typedef CategoryQuerySnapshotType = FirestoreQuerySnapshot<models.Category,
    FirestoreDocumentSnapshot<models.Category>>;

typedef CategoryDocumentSnapshotType
    = FirestoreDocumentSnapshot<models.Category>;

typedef CategoryDocumentReferenceType
    = FirestoreDocumentReference<models.Category, CategoryDocumentSnapshotType>;

