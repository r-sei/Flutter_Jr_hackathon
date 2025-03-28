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

    // NaNを0に変換
    var fixedTaskScores = taskScores.map((key, value) =>
      MapEntry(key, value.isNaN ? 0.0 : value));

    // 降順ソート
    var sortedEntries = fixedTaskScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // ランク付け（同じスコアは同じ順位）
    List<MapEntry<String, double>> rankedEntries = [];
    Map<String, int> rankMap = {}; // 各エントリの実際の順位を記録
    int currentRank = 1;
    for (int i = 0; i < sortedEntries.length; i++) {
      if (i > 0 && sortedEntries[i].value != sortedEntries[i - 1].value) {
        currentRank = i + 1;
      }
      rankedEntries.add(MapEntry(sortedEntries[i].key, sortedEntries[i].value));
      rankMap[sortedEntries[i].key] = currentRank; // 実際の順位を保存
      print('${sortedEntries[i].key}: ${sortedEntries[i].value} -> Rank: $currentRank');
    }

    // 指定された `rank` が範囲外なら「ランキング外」を表示
    if (rank > rankedEntries.length) {
      return const Text('ランキング外');
    }

    var rankEntry = rankedEntries[rank-1];
    int displayRank = rankMap[rankEntry.key]!; // 実際の順位を取得

    return Column(
      children: [
        Row(children: [
          const Gap(50),
          Expanded(
            child: Text('$displayRank位: ' + rankEntry.key),
            ),
          // Gap(20),
          Text(rankEntry.value.toString()),
          const Gap(100),
        ],),
        const Gap(10),
      ],
    );
  }
}