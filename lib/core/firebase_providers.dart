import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@riverpod
FirebaseFirestore firestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@riverpod
CollectionReference<Map<String, dynamic>> homeCollection(Ref ref) {
  return ref.read(firestoreProvider).collection('home');
}

@riverpod
CollectionReference<Map<String, dynamic>> taskCollection(Ref ref) {
  return ref.read(firestoreProvider).collection('task');
}
