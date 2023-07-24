import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/view/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

const kNotesBox = 'notes_box';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: ' Rubik',
      ),
      home: const NotesView(),
    );
  }
}
