import 'package:bloc/bloc.dart';
import 'package:cars/core/helpers/hive_helper.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void getNote() async {
    emit(NoteLoadeState());
    await HiveHelper.getNote();
    if (HiveHelper.MyNotes.isEmpty) {
      emit(NoteEmptyState());
    } else {
      emit(NoteSuccesesState());
    }
  }

  void addNote(String text) {
    HiveHelper.addNote(text);
    emit(NoteAddedState());
  }

  void deleteAllNote() {
    HiveHelper.deleteAllNote();
    emit(NoteDeletAllState());
  }

  void UpdateNote(int index, String text) {
    HiveHelper.UpdateNote(index, text);
    emit(NoteUpdateState());
  }

  void deleteNote(int index) {
    HiveHelper.deleteNote(index);
    emit(NoteDeletAllState());
  }
}
