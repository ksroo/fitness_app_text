import 'package:fitness_app/extensions/list_ex.dart';
import 'package:fitness_app/home/bloc/exercics_cubit/exercics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercicsList extends StatelessWidget {
  final int programId;
  const ExercicsList({
    super.key,
    required this.programId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExercicsCubit, ExercicsState>(
      builder: (context, state) {
        if (state is ExercicsSuccessState) {
          return ListView.separated(
            itemCount: state.exercicsList.exercicsListLength(programId),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final list = state.exercicsList.exercicsSearchList(programId);
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(list[index].exercicName),
                    InkWell(
                      onTap: () {
                 
                        ExercicsCubit.get(context).removeExercics(
                            exercicName: list[index].exercicName,
                            programId: programId);
                      },
                      child: const Icon(
                        Icons.delete,
                        size: 15,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
