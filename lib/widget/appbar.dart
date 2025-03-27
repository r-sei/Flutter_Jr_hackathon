import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
import 'package:flutter_jr_hackathon/style/custom_shape.dart';
import 'package:flutter_jr_hackathon/widget/profile_icon_button.dart';
import 'package:flutter_jr_hackathon/widget/tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

//アカウントのモックデータ
enum Account {
  ryosei('ryosei', Colors.yellow),
  kosei('kosei', Colors.green),
  taipon('taipon', Colors.lightBlue),
  wasapon('wasapon', Colors.orange),
  yuta('yuta', Colors.red);

  const Account(this.name, this.color);

  final String name;
  final Color color;
}

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
      leading: ProfileIconButton(
          color: Colors.grey,
          onPressed: () => Scaffold.of(context).openDrawer()),
      flexibleSpace: Stack(children: [
        MyTab(
          hSize: hSize,
          wSize: wSize,
          tab: tab,
          margin: margin,
          topMargin: topMargin,
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
                            width: wSize / 2 - 20,
                            child: Row(
                              children: [
                                const Gap(54),
                                // const Gap(16),
                                // todo:アカウントごとに色変更
                                // ProfileIconButton(
                                //     color: Colors.grey,
                                //     onPressed: () =>
                                //         Scaffold.of(context).openDrawer()),
                                // const Gap(8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      //todo 現在のアカウントの名前に変更
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
                          Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/images/Frame 2.png',
                                width: 40,
                                height: 40,
                              )),
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
