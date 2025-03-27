import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/components/task_progress_post.dart';
import 'package:flutter_jr_hackathon/home/home_floating_action_button.dart';
import 'package:flutter_jr_hackathon/widget/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart'; 
class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const [
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
              TaskProgressPost(
                useName: 'pochipochi',
                achievement: 'hackathon',
                likesnumber: '50',
                percentage: 0.3,
              ),
              Gap(8),
            ],
          ),
        ),
      ),
      floatingActionButton: const HomeFloatingActionButton(),
    );
  }
}
