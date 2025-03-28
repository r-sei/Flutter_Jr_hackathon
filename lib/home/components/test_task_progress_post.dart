import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/components/good_button.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TestTaskProgressPost extends StatelessWidget {
  const TestTaskProgressPost({super.key, required this.progress});

  final Progress progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ヘッダー部分（アイコン + ユーザー情報）
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                child: Text(progress.userName[0]),
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    progress.userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat('yyyy/MM/dd').format(progress.createdAt),
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
          const Gap(8),
          // タスクタイトル
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              progress.taskTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(8),
          // 本文
          Text(
            progress.progressTitle,
            style: const TextStyle(fontSize: 16),
          ),
          const Gap(12),
          // フッター部分（いいねボタン + 進捗バー）
          Row(
            children: [
              GoodButton(progress: progress),
              const Gap(4),
              Text(
                progress.likes.length.toString(),
                style: const TextStyle(fontSize: 14),
              ),
              const Gap(24),
              const Icon(Icons.directions_run, size: 18),
              const Gap(4),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 14.0,
                    percent: progress.achieveLevel,
                    backgroundColor: Colors.grey.shade200,
                    progressColor: Colors.green,
                    barRadius: Radius.zero,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              const Gap(8),
              Text('${(progress.achieveLevel * 100).toInt()}%'),
            ],
          ),
        ],
      ),
    );
  }
}
