import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/core/firebase_providers.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'home_view_model.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> progress(Ref ref) {
  final snapshots = ref.read(homeCollectionProvider).snapshots();
  return snapshots;
}

//ペナルティ用のtextEditingController
@riverpod
TextEditingController penaltyController(Ref ref, Progress? progress) {
  return TextEditingController(text: progress?.progressTitle);
}

@riverpod
class ProgressNotifier extends _$ProgressNotifier {
  @override
  String build() {
    return '';
  }

  //進捗作成
  Future<void> create(String title, double achieveLevel) async {
    final progress = Progress(
        progressID: const Uuid().v4(),
        userName: '',
        progressTitle: title,
        achieveLevel: achieveLevel,
        likes: 0);

    await ref
        .read(homeCollectionProvider)
        .doc(progress.progressID)
        .set(progress.toJson());
  }
}
