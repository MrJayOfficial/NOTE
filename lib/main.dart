import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/headscene.dart';
import 'package:note/page/homepage.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('notebox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartingScene(),
    );
  }
}
