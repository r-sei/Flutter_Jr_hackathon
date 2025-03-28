import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_jr_hackathon/core/firebase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_name_provider.g.dart';

@riverpod
CollectionReference<Map<String, dynamic>> usersCollection(Ref ref) {
  return ref.read(firestoreProvider).collection('users');
}
