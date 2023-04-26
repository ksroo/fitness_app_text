import 'package:fitness_app/models/exercics_model.dart';

extension ListExercics on List<ExercicsModel> {

  
 int exercicsListLength(int programId) {
    return where((e) => e.programId == programId).toList().length;
  }


 List<ExercicsModel> exercicsSearchList(int programId) {
    return where((e) => e.programId == programId).toList();
  }
}
