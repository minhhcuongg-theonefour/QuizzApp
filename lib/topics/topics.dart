import 'package:flutter/material.dart';
import 'package:quizzapp/shared/bottom_nav.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
