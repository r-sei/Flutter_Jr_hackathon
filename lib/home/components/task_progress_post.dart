import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/components/good_button.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/task/task_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TaskProgressPost extends ConsumerWidget {
  TaskProgressPost({
    super.key,
    required this.progress,
  });

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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
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
                    color: getWeekMondayToSunday(taskCreatedDate) ==
                            getWeekMondayToSunday(DateTime.now())
                        ? Colors.white
                        : Colors.red,
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
                // const Text('進捗度'),
                const Icon(Icons.directions_run),
                // Text('${progress.achieveLevel * 100}'),
                // const Text('%'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 142,
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
                Text('${progress.achieveLevel * 100}'),
                const Text('%'),
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
