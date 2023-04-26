import 'package:fitness_app/models/program_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'programer_state.dart';

class ProgramerCubit extends Cubit<ProgramerState> {
  ProgramerCubit() : super(ProgramerInitial());

  static ProgramerCubit get(BuildContext context) => BlocProvider.of(context);

  List<ProgramModel> list = [];

  void addProgram({required String name, required int id}) {
    list.add(ProgramModel(id: id, name: name));

    emit(ProgramerSuccessState(list));
  }

  void deletedProgram(int index) {
    list.removeAt(index);
    emit(ProgramerSuccessState(list));
  }

  void editProgram({required int id, required String editName}) {
    // int listIndex = list.indexWhere((e) => e.id == id);

    list.removeWhere(
      (e) => e.id == id,
    );

    list.add(ProgramModel(id: editName.hashCode, name: editName));

    emit(ProgramerSuccessState(list));
  }
}
