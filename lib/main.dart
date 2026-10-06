import 'package:cars/notepage/cupit/cubit/note_cubit.dart';
import 'package:cars/notepage/view/NotePage.dart';
import 'package:cars/core/helpers/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(HiveHelper.noteBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NoteCubit()..getNote(),
        child: Notepage(),
      ),
    );
  }
}
