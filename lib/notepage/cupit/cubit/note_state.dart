part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteSuccesesState extends NoteState {}

final class NoteLoadeState extends NoteState {}

final class NoteEmptyState extends NoteState {}

final class NoteAddedState extends NoteState{}

final class NoteDeletAllState extends NoteState{}

final class NoteUpdateState extends NoteState{}

final class NotedeletState extends NoteState{}



