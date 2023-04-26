import 'package:fitness_app/models/exercics_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercics_state.dart';

class ExercicsCubit extends Cubit<ExercicsState> {
  ExercicsCubit() : super(ExercicsInitial());

  static ExercicsCubit get(BuildContext context) => BlocProvider.of(context);

  List<ExercicsModel> list = [];

  void addExercics({required String exercicsName, required int programId}) {
    list.add(ExercicsModel(exercicName: exercicsName, programId: programId));

    emit(ExercicsSuccessState(list));
  }

  void removeExercics({required String exercicName, required int programId}) {

    list.removeWhere((e) => e.exercicName == exercicName && e.programId == programId,);
    emit(ExercicsSuccessState(list));
  }
}
