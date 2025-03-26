import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/components/good_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TaskProgressPost extends StatelessWidget {
  const TaskProgressPost(
      {super.key,
      required this.useName,
      required this.achievement,
      required this.likesnumber,
      required this.percentage});
  final String useName;
  final String achievement;
  final String likesnumber;
  final double percentage;

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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                useName,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              const Text(
                'が',
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
                achievement,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              const Text(
                'を',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const Text(
            '達成しました',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const GoodButton(),
                Text(
                  likesnumber,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 40),
                const Text('達成率'),
                LinearPercentIndicator(
                  width: 140.0,
                  lineHeight: 14.0,
                  percent: percentage,
                  backgroundColor: Colors.white,
                  progressColor: Colors.green,
                  leading: Row(
                    children: [
                      Text('${percentage*100}'),
                      const Text('%'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
