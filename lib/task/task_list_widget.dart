import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_view_model.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/task/ranking_score_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({
    super.key,
    required this.task,
    required this.thisWeek,
  });

  final Task task;
  final String thisWeek;

  // double getScore(Progress progress) {
  //   double score;
  //     progress.likes.length
  //   return score;
  // }

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
    print('----------taskTitle: ${task.taskTitle}----------');

    final List<Progress> progressList = ref.watch(progressProvider).when(
      data: (data) {
        print('data');
        return data.docs.map((e) => Progress.fromJson(e.data())).toList();
      },
      error: (error, _) {
        print('error');
        return [];
      },
      loading: () {
        print('loading');
        return [];
      },
    );

    // groupNameに属するuserNameのリストを作成
    List<String> nameList = [];
    // print(task.groupName);
    // print(progressList);
    for (final progress in progressList) {
      // print(progress.groupName);
      if (progress.groupName == task.groupName &&
          !nameList.contains(progress.userName)) {
        nameList.add(progress.userName);
      }
    }

    // あるタスクに対する各々のスコアを計算
    Map<String, double> taskScores = {};
    // print(nameList);
    for (final userName in nameList) {
      // あるuserNameのtaskTitleに対するスコアを計算
      // print(userName);
      int postCount = 0;
      double average = 0;
      double score = 0;
      double maxAchieveLevel = 0;
      for (final progress in progressList) {
        if (progress.taskTitle == task.taskTitle &&
            progress.userName == userName) {
          average = average + progress.likes.length;
          postCount++;
          if (maxAchieveLevel < progress.achieveLevel) {
            maxAchieveLevel = progress.achieveLevel;
          }
        }
      }
      average = average / postCount;
      score = average * maxAchieveLevel;
      taskScores[userName] = score;
      // print('test');
      print(taskScores);
    }

    // var sortedEntries = taskScores.entries.toList()..sort((a,b) => b.value.compareTo(a.value));
    // Map<String, double> sortedTaskScores = {for (var e in sortedEntries) e.key: e.value};

    // タスクが該当する期間を取得
    String term = getWeekMondayToSunday(task.createdAt);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      // height: 300,
      decoration: BoxDecoration(
        color: term == thisWeek ? Colors.white : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ExpandablePanel(
            header: Column(children: [
              const Gap(5),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text(
                    term,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    ),
                ),
              ),
              const Gap(10),
              // ListTile(
              //   contentPadding: EdgeInsets.zero,
              //   title: Text(
              //     'Task',
              //     maxLines: 1,
              //   ),
              //   subtitle: Text(
              //     'penalty',
              //     maxLines: 1,
              //     style: TextStyle(
              //       fontSize: 10,
              //       color: Colors.red
              //     ),
              //   ),
              // ),
              Text(
                task.taskTitle,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ペナルティ：' + task.penalty,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              
              const Row(children: [
                Gap(110),
                Expanded(
                  child: Text('名前')
                  ),
                // Gap(20),
                Text('スコア'),
                Gap(50),
              ],),
              const Gap(10),
            ],
          ),
          // progressListが空の時にはソートせずにデフォルト値を入れるようにすれば、エラー回避可能？
          // collapsed: RankingScoreWidget(
          //   rank: taskScores.isNotEmpty
          //       ? ((taskScores.entries.toList()..sort((a, b) => b.value.compareTo(a.value))).first.value.isFinite
          //           ? (taskScores.entries.toList()..sort((a, b) => b.value.compareTo(a.value))).first.value.toInt()
          //           : 1)
          //       : 1,
          //   taskScores: taskScores,
          // ),

          collapsed: RankingScoreWidget(
            rank: 1,
            taskScores: taskScores,
          ),

          // expanded: Column(
          //   children: [
          //     if (taskScores.isNotEmpty)  // taskScoresが空でない場合のみ処理
          //       for (var entry in taskScores.entries.toList()..sort((a, b) => b.value.compareTo(a.value)))
          //         RankingScoreWidget(
          //           rank: entry.value.isFinite ? entry.value.toInt() : 0,
          //           taskScores: taskScores,  // NaNやInfinityの場合は0を設定
          //         )
          //     else
          //       RankingScoreWidget(
          //         rank: 0,
          //         taskScores: taskScores,
          //         ),  // taskScoresが空の場合にはデフォルト値として0を設定
          //   ],
          // ),

          expanded: Column(
            children: [
              for (int i = 0; i < nameList.length; i++) ...{
                RankingScoreWidget(
                  rank: i + 1,
                  taskScores: taskScores,
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}
