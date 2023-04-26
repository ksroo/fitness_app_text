import 'package:fitness_app/home/bloc/exercics_cubit/exercics_cubit.dart';
import 'package:fitness_app/home/bloc/programer_cubit/programer_cubit.dart';
import 'package:fitness_app/home/view/widgets/list_exercics.dart';
import 'package:fitness_app/models/program_model.dart';
import 'package:fitness_app/widgets/cusbtom_add.dart';
import 'package:fitness_app/widgets/custom_edit.dart';
import 'package:flutter/material.dart';

class ListProgramer extends StatefulWidget {
  final List<ProgramModel> programList;
  const ListProgramer({
    super.key,
    required this.programList,
  });

  @override
  State<ListProgramer> createState() => _ListProgramerState();
}

class _ListProgramerState extends State<ListProgramer> {
  String valueName = "";

  TextEditingController addExercicsController = TextEditingController();

  @override
  void dispose() {
    addExercicsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.programList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ExpansionTile(
          // initiallyExpanded: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.programList[index].name),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _addExercics(context, index);
                },
                icon: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  ExercicsCubit.get(context).list.removeWhere(
                      (e) => e.programId == widget.programList[index].id);
                  ProgramerCubit.get(context).deletedProgram(index);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  _editProgram(context, index);
                },
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ],
          ),

          children: [
            ExercicsList(programId: widget.programList[index].id),
          ],
        );
      },
    );
  }

  Future<dynamic> _addExercics(BuildContext context, int index) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: CustomAdd(
                onPressed: () {
                  ExercicsCubit.get(context).addExercics(
                      exercicsName: addExercicsController.text,
                      programId: widget.programList[index].id);
                  addExercicsController.clear();
                  Navigator.of(context).pop();
                },
                controller: addExercicsController,
                isProgram: true,
              ),
            ),
          ),
        );
      },
    );
  }

  void _editProgram(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: CustomEdit(
                onPressed: () {
                  ProgramerCubit.get(context).editProgram(
                      id: widget.programList[index].id, editName: valueName);
                  Navigator.of(context).pop();
                },
                onChanged: (value) {
                  setState(() {
                    valueName = value;
                  });
                },
                isProgram: true,
                initialValue: widget.programList[index].name,
              ),
            ),
          ),
        );
      },
    );
  }
}
