import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/components/good_button.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/task/task_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TestTaskProgressPost extends ConsumerWidget {
  TestTaskProgressPost({super.key, required this.progress});

  final Progress progress;

  final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
  //todo: 現在選択されているアカウントに応じたtileのUIに変更（いいねボタンとか特に）

  String getWeekMondayToSunday(DateTime dateTime) {
    // 入力された日付がその週の何曜日かを取得
    int weekday = dateTime.weekday;

    // 月曜日の日付を計算 (weekday が 1 は月曜日)
    DateTime monday = dateTime.subtract(Duration(days: weekday - 1));

    // 日曜日の日付を計算 (weekday が 7 は日曜日)
    DateTime sunday = dateTime.add(Duration(days: 7 - weekday));

    // 月曜日と日曜日の日付を yyyy/MM/DD 形式でフォーマット
    String formattedMonday = DateFormat('yyyy/MM/dd').format(monday);
    String formattedSunday = DateFormat('yyyy/MM/dd').format(sunday);

    // 結果を "yyyy/MM/DD - yyyy/MM/DD" 形式で返す
    return '$formattedMonday - $formattedSunday';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Task> taskList = ref.watch(tasksProvider).when(
      data: (data) {
        List<Task> tasks =
            data.docs.map((e) => Task.fromJson(e.data())).toList();

        // createdAt で降順ソート (新しい順)
        tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        // createdAt で昇順ソート (古い順)
        // tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        return tasks;
      },
      error: (error, _) {
        return [];
      },
      loading: () {
        return [];
      },
    );

    DateTime taskCreatedDate =
        DateTime.now(); // エラー回避でDateTime.now()で初期化しているけど、ifで必ずヒットするから問題ないはず...
    for (final task in taskList) {
      if (task.taskTitle == progress.taskTitle) {
        taskCreatedDate = task.createdAt;
      }
    }

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
              Expanded(
                child: Row(
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
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: Text(
                  '期限切れ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: getWeekMondayToSunday(taskCreatedDate) ==
                            getWeekMondayToSunday(DateTime.now())
                        ? Colors.white
                        : Colors.red,
                  ),
                ),
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
              Container(
                width: 202.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: LinearPercentIndicator(
                  width: 200.0,
                  lineHeight: 14.0,
                  percent: progress.achieveLevel,
                  backgroundColor: Colors.grey.shade200,
                  progressColor: Colors.green,
                  barRadius: Radius.zero,
                  padding: EdgeInsets.zero,
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
