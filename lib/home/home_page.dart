import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_floating_action_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home appbar dayo'),
      ),
      floatingActionButton: const HomeFloatingActionButton(),
    );
  }
}
