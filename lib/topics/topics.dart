import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzapp/services/firestore.dart';
import 'package:quizzapp/services/models.dart';
import 'package:quizzapp/shared/bottom_nav.dart';
import 'package:quizzapp/topics/topic_item.dart';

import 'drawer.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Data is loading');
        } else if (snapshot.hasError) {
          return Center(
            // child: ErrorMessage(message: snapshot.error.toString()),
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            drawer: TopicDrawer(topics : topics),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(18.0),
              crossAxisSpacing: 12.0,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),

            ),
            bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          return const Text('No topics found in Firestore. Check database');
        }
      },
    );
  }
}
