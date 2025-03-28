import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_jr_hackathon/auth/user_name_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

@riverpod
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

@riverpod
String? currentUserID(Ref ref) {
  return ref.watch(firebaseAuthProvider).currentUser?.uid;
}

@riverpod
Future<String?> userName(Ref ref) async {
  final userID = ref.watch(currentUserIDProvider);
  if (userID == null) return null;

  final doc = await ref.read(usersCollectionProvider).doc(userID).get();
  return doc.data()?['name'] as String?;
}
