import 'package:app_music/Screen/PlayMusic.dart';
import 'package:app_music/Screen/screens.dart';
import 'package:flutter/material.dart';

import 'Screen/Home.dart';

Future<void> main() async {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Screens(),
    );
  }
}

