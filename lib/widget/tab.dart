import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/main/bottom_navigation_provider.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
import 'package:flutter_jr_hackathon/style/custom_shape.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MyTab extends ConsumerWidget {
  final double hSize;
  final double tab;
  final double margin;
  final double topMargin;
  final double wSize;

  const MyTab({
    super.key,
    required this.hSize,
    required this.wSize,
    required this.tab,
    required this.margin,
    required this.topMargin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(bottomNavigationNotifierProvider);
    Color textColor = col['text1'] ?? Colors.black;
    Color tabColor = col['accent2'] ?? Colors.transparent;
    String text = 'タイム\nライン';
    if(page == 1){
        textColor = col['text1'] ?? Colors.black;
        tabColor = col['accent1'] ?? Colors.transparent;
        text = 'タスク\nリスト';
    }else{
        textColor = col['text1'] ?? Colors.black;
        tabColor = col['accent2'] ?? Colors.transparent;
        text = 'タイム\nライン';
    }
    return CustomPaint(
          painter: BoxShadowPainter2(),
          child: ClipPath(
            clipper: CustomShape2(),
            child: Container(
              height: hSize,
              width: wSize,
              color: tabColor,
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
                            text,
                            style: TextStyle(
                              color: textColor,
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
        );
  }
}