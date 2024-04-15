import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreProvider = Provider(
  (ref) => FirestoreDB(
    firestore: FirebaseFirestore.instance,
  ),
);

class FirestoreDB {
  final FirebaseFirestore firestore;

  const FirestoreDB({
    required this.firestore,
  });
}
