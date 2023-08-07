import 'package:quizzapp/about/about.dart';
import 'package:quizzapp/home/home.dart';
import 'package:quizzapp/login/login.dart';
import 'package:quizzapp/profile/profile.dart';
import 'package:quizzapp/quiz/quiz.dart';
import 'package:quizzapp/topics/topics.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => const LoginPage(),
  '/topics': (context) => const TopicPage(),
  '/profile':(context) => const ProfilePage(),
  '/about':(context) => const AboutPage(),
};