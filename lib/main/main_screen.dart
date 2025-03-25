import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_page.dart';
import 'package:flutter_jr_hackathon/main/bottom_navigation_provider.dart';
import 'package:flutter_jr_hackathon/main/main_bottom_navigation_bar.dart';
import 'package:flutter_jr_hackathon/task/task_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = [const HomePage(), const TaskPage()];

    return Scaffold(
      body: pages[ref.watch(bottomNavigationNotifierProvider)],
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
