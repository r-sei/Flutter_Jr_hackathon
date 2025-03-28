import 'package:flutter_jr_hackathon/widget/appbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_notifier.g.dart';

@riverpod
class AccountManagement extends _$AccountManagement {
  @override
  Account build() {
    return Account.ryosei;
  }

  void change(Account account) {
    state = account;
  }
}
