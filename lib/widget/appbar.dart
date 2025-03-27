import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
import 'package:flutter_jr_hackathon/style/custom_shape.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';


class MyAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.hSize = 100,
    this.tab = 75,
    this.topMargin = 20,
  });

  final double hSize;
  final double tab;
  final double topMargin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double wSize = MediaQuery.of(context).size.width;
    double margin = 5;
    return AppBar(
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Stack(children: [
        CustomPaint(
          painter: BoxShadowPainter2(),
          child: ClipPath(
            clipper: CustomShape2(),
            child: Container(
              height: hSize,
              width: wSize,
              color: col['accent2'],
              child: Column(
                children: [
                  Gap(topMargin + margin + 3),
                  Row(
                    children: [
                      SizedBox(width: wSize - tab + 1 + margin),
                      SizedBox(
                        width: tab - 1 - 2 * margin,
                        height: hSize - 50 - 2 * margin,
                        child: FittedBox(
                          child: Text(
                            'タイム\nライン',
                            style: TextStyle(
                              color: col['text1'],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        CustomPaint(
          painter: BoxShadowPainter(),
          child: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: hSize,
              width: wSize,
              color: col['appbar'],
              child: Column(
                children: [
                  Gap(topMargin),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: hSize - topMargin - 25,
                      width: wSize - tab - 25,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            height: hSize - topMargin - 25,
                            width: wSize/2 - 16,
                            child: Row(
                              children: [
                                const Gap(16),
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: col['accent1'],
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PochiPochi',
                                      style: TextStyle(
                                        color: col['text1'],
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'いっぱい勉強しよう！',
                                      style: TextStyle(
                                        color: col['text1'],
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Image.asset('lib/souce/looks.png', width: 16, height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hSize);
}
