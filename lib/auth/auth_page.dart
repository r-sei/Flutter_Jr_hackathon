import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/auth/visibility_provider.dart';
import 'package:flutter_jr_hackathon/main/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final groupNameController = TextEditingController();
  final maleAddressController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(visibilityNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpandablePanel(
              header: Text("login"),
              collapsed: SizedBox
                  .shrink(), // Add a placeholder widget for collapsed state
              expanded: Column(
                children: [
                  TextField(
                    controller: maleAddressController,
                    decoration: InputDecoration(labelText: 'Mail Address'),
                    onChanged: (value) => {},
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () => ref
                            .read(visibilityNotifierProvider.notifier)
                            .update(!visibility),
                        icon: Icon(
                          visibility ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: visibility,
                    onChanged: (value) => {},
                  ),
                  Gap(20),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        // メール/パスワードでログイン
                        final User? user = (await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                          email: maleAddressController.text,
                          password: passwordController.text,
                        ))
                            .user;
                        if (user != null)
                          print("ログインしました　${user.email} , ${user.uid}");
                        ref
                            .read(visibilityNotifierProvider.notifier)
                            .update(true);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainScreen()));
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
            //////////////////
            //create account//
            //////////////////
            ExpandablePanel(
              header: Text('Create Account'),
              collapsed: SizedBox.shrink(),
              expanded: Column(children: [
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(labelText: 'User Name'),
                  onChanged: (value) => {},
                ),
                TextField(
                  controller: groupNameController,
                  decoration: InputDecoration(labelText: 'Group Name'),
                  onChanged: (value) => {},
                ),
                TextField(
                  controller: maleAddressController,
                  decoration: InputDecoration(labelText: 'Mail Address'),
                  onChanged: (value) => {},
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () => ref
                          .read(visibilityNotifierProvider.notifier)
                          .update(!visibility),
                      icon: Icon(
                        visibility ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: visibility,
                  onChanged: (value) => {},
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      final User? user = (await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                        email: maleAddressController.text,
                        password: passwordController.text,
                      ))
                          .user;
                      if (user != null) {
                        print("ユーザ登録しました ${user.email} , ${user.uid}");
                        CollectionReference users =
                            FirebaseFirestore.instance.collection('users');
                        Future<void> Register() {
                          return users.doc(user.uid)
                              .set({
                                'name': userNameController.text,
                                'email': maleAddressController.text,
                                'group': groupNameController.text,
                              })
                              .then((value) => print("新規登録に成功"))
                              .catchError(
                                  (error) => print("新規登録に失敗しました!: $error"));
                        }

                        Register();
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
              ]),
            ),
            ExpandablePanel(
              header: Text("login"),
              collapsed: SizedBox
                  .shrink(), // Add a placeholder widget for collapsed state
              expanded: Column(children: [
                TextField(
                  controller: maleAddressController,
                  decoration: InputDecoration(labelText: 'Mail Address'),
                  onChanged: (value) => {},
                ),
                Gap(20),
                TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: maleAddressController.text);
                      print("パスワードリセット用のメールを送信しました");
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
