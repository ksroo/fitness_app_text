part of 'exercics_cubit.dart';

@immutable
abstract class ExercicsState {}

class ExercicsInitial extends ExercicsState {}

class ExercicsSuccessState extends ExercicsState {
  final List<ExercicsModel> exercicsList;

  ExercicsSuccessState(this.exercicsList);
}
