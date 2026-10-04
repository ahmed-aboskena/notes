import 'package:cars/NotePage.dart';
import 'package:cars/core/helpers/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.noteBox);
  //await Hive.box("Box1").put('Key1',"Ahmed");
  //print( Hive.box("Box1").get("Key1"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Notepage());
  }
}
