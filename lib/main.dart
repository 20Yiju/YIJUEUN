import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Login/home2.dart';
import 'Login/login.dart';
import 'addDiary.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Suit',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/home2': (BuildContext context) => const Home2(),
        '/home': (BuildContext context) => const HomePage(),
        '/addDiary': (BuildContext context) => const AddDiary(),
    );
  }
}