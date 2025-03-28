import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/components/test_task_progress_post.dart';
import 'package:flutter_jr_hackathon/home/home_floating_action_button.dart';
import 'package:flutter_jr_hackathon/home/home_view_model.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/widget/account_notifier.dart';
import 'package:flutter_jr_hackathon/widget/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountManagementProvider);
    final List<Progress> progressList = ref.watch(progressProvider).when(
      data: (data) {
        return data.docs.map((e) => Progress.fromJson(e.data())).toList();
      },
      error: (error, _) {
        return [];
      },
      loading: () {
        return [];
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(account: account),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              for (final progress in progressList) ...{
                TestTaskProgressPost(
                  progress: progress,
                ),

                // TaskProgressPost(
                //   progress: progress,
                // ),
                const Gap(16),
              },
            ],
          ),
        ),
      ),
      // drawer: const SideMenu(),
      floatingActionButton: const HomeFloatingActionButton(),
    );
  }
}
