import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RankingScoreWidget extends StatelessWidget {
  const RankingScoreWidget({
    super.key,
    required this.rank,
  });

  final int rank;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Gap(50),
      Expanded(
        child: Text('$rank位: 名前')
        ),
      // Gap(20),
      Text('達成度'),
      const Gap(100),
    ],);
  }
}