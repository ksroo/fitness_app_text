import 'package:fitness_app/home/bloc/programer_cubit/programer_cubit.dart';
import 'package:fitness_app/home/view/widgets/add_buttons.dart';
import 'package:fitness_app/home/view/widgets/list_programer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const AddButtons(),
          BlocBuilder<ProgramerCubit, ProgramerState>(
            builder: (context, state) {
              if (state is ProgramerSuccessState) {
                return ListProgramer(
                  programList: state.programList,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
