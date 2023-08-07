import 'package:flutter/material.dart';
import 'package:quizzapp/login/login.dart';
import 'package:quizzapp/services/auth.dart';
import 'package:quizzapp/topics/topics.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          } else if (snapshot.hasData) {
            return const TopicPage();
          } else {
            return const LoginPage();
          }
        });
  }
}
