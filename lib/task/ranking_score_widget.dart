import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RankingScoreWidget extends StatelessWidget {
  const RankingScoreWidget({
    super.key,
    required this.rank,
    required this.taskScores,
  });

  final int rank;
  final Map<String, double> taskScores;

  @override
  Widget build(BuildContext context) {

    print(taskScores.entries);
    var sortedEntries = taskScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value)); // 降順でソート

    // rank番目のエントリを取得（rankは1始まりであることを想定）
    if (rank - 1 >= sortedEntries.length) {
      return Text('ランキング外');
    }

    var rankEntry = sortedEntries[rank-1];

    double displayValue = rankEntry.value.isNaN ? 0 : rankEntry.value;

    return Column(
      children: [
        Row(children: [
          Gap(50),
          Expanded(
            child: Text('$rank位: ' + rankEntry.key),
            ),
          // Gap(20),
          Text(displayValue.toString()),
          const Gap(100),
        ],),
        Gap(10),
      ],
    );
  }
}