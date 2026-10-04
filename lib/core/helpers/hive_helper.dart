import 'package:hive/hive.dart';

class HiveHelper {
  static const noteBox = "Note_Box";
  static const notKey = "Note_Key";
  static List<String> MyNotes = [];

  static Future<void> getNote() async {
    await Future.delayed(Duration(seconds: 5));
    MyNotes = await Hive.box(noteBox).get(notKey);
  }

  static void addNote(String note) async {
    MyNotes.add(note);
    await Hive.box(noteBox).put(notKey, MyNotes);
  }

  static void deleteNote(int index) async {
    MyNotes.removeAt(index);
    await Hive.box(noteBox).put(notKey, MyNotes);
  }

  static void deleteAllNote() async {
    MyNotes.clear();
    await Hive.box(noteBox).put(notKey, MyNotes);
  }

  static void UpdateNote(int index, String text) async {
    HiveHelper.MyNotes[index] = text;
    await Hive.box(noteBox).put(notKey, MyNotes);
  }
}
