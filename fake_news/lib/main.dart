import 'package:fake_news/screens/testing_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake News Detection App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: 'DMSans',
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 44, 43, 43),
      ),
      home: TestingSection(),
    );
  }
}
