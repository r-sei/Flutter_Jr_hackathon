import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/main/bottom_navigation_provider.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainBottomNavigationBar extends ConsumerWidget {
  const MainBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const pageType = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.menu_book_outlined),
        activeIcon: Icon(Icons.menu_book),
        label: 'Task',
      ),
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: col['appbar'],
      unselectedItemColor: Colors.grey[400],
      selectedIconTheme: const IconThemeData(size: 32),
      unselectedIconTheme: const IconThemeData(size: 28),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      items: pageType,
      currentIndex: ref.watch(bottomNavigationNotifierProvider),
      onTap: (newIndex) {
        ref.read(bottomNavigationNotifierProvider.notifier).update(newIndex);
      },
    );
  }
}
