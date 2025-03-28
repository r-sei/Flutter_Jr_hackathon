import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/core/firebase_providers.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/widget/account_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'home_view_model.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> progress(Ref ref) {
  final snapshots = ref.read(homeCollectionProvider).snapshots();
  return snapshots;
}

// 進捗用のtextEditingController
@riverpod
TextEditingController progressController(Ref ref, Progress? progress) {
  return TextEditingController(text: progress?.progressTitle);
}

@riverpod
class ProgressNotifier extends _$ProgressNotifier {
  @override
  String build() {
    return '';
  }

  // 進捗作成
  Future<void> create(
      String taskTitle, String progressTitle, double achieveLevel) async {
    final progress = Progress(
        progressID: const Uuid().v4(),
        userName: ref.watch(accountManagementProvider).name,
        taskTitle: taskTitle,
        progressTitle: progressTitle,
        achieveLevel: achieveLevel,
        likes: []);

    await ref
        .read(homeCollectionProvider)
        .doc(progress.progressID)
        .set(progress.toJson());
  }
}

// いいね用
@riverpod
class LikesNotifier extends _$LikesNotifier {
  @override
  String build() {
    return '';
  }

  // todo
  // 最後の引数用修正
  Future<void> add(Progress progress) async {
    await ref.read(homeCollectionProvider).doc(progress.progressID).update({
      'likes': FieldValue.arrayUnion([progress.userName]),
    });
  }

  // todo
  // 最後の引数用修正
  Future<void> delete(Progress progress) async {
    await ref.read(homeCollectionProvider).doc(progress.progressID).update({
      'likes': FieldValue.arrayRemove([progress.userName]),
    });
  }
}
