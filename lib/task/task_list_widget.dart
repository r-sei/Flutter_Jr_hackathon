import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/task/ranking_score_widget.dart';
import 'package:gap/gap.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      // height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ExpandablePanel(
            header: const Column(children: [
              Gap(10),
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
                'タスク',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              Text('ペナルティ'),
              Divider(
                thickness: 2,
                ),
            ],),
            collapsed: const Column(
              children: [
                RankingScoreWidget(rank: 1,),
                Gap(10),
              ],
            ),
            expanded: const Column(children: [
              RankingScoreWidget(rank: 1),
              Gap(10),
              RankingScoreWidget(rank: 2),
              Gap(10),
              RankingScoreWidget(rank: 3),
              Gap(10),
            ],),
          ),
        ),
    );
  }
}