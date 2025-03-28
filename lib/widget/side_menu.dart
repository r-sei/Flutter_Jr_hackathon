import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/widget/account_notifier.dart';
import 'package:flutter_jr_hackathon/widget/appbar.dart';
import 'package:flutter_jr_hackathon/widget/profile_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todo: 選択中のアカウントはlistTileの色変えたい
    // final currentAccount = ref.watch(accountManagementProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Center(child: Text('アカウント切り替え'))),
          const Divider(),
          const Gap(8),
          for (final account in Account.values) ...{
            ListTile(
              leading: ProfileIconButton(color: account.color, onPressed: null),
              title: Text(account.name),
              onTap: () {
                ref.read(accountManagementProvider.notifier).change(account);
                //多分ここでprogressの更新がいる
                Navigator.pop(context);
              },
            ),
          },
        ],
      ),
    );
  }
}
