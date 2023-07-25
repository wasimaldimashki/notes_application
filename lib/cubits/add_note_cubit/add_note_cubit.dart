import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  dNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box(kNotesBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } on Exception catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}
