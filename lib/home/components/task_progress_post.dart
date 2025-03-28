import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/components/good_button.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TaskProgressPost extends StatelessWidget {
  TaskProgressPost({
    super.key,
    required this.progress,
  });

  final Progress progress;
  final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
  //todo: 現在選択されているアカウントに応じたtileのUIに変更（いいねボタンとか特に）
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text(progress.taskTitle),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: Text(
                  '期限切れ',
                  style: TextStyle(
                    color: progress.createdAt.compareTo(oneWeekAgo) < 0
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                progress.userName,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              const Text(
                'は',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                progress.progressTitle,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                GoodButton(progress: progress),
                Text(
                  progress.likes.length.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 40),
                const Text('達成率'),
                Text('${progress.achieveLevel * 100}'),
                const Text('%'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 142,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 14.0,
                      percent: progress.achieveLevel,
                      backgroundColor: Colors.white,
                      progressColor: Colors.green,
                      barRadius: Radius.zero,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('投稿日 '),
                Text(
                    '${progress.createdAt.year}/${progress.createdAt.month}/${progress.createdAt.day}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
