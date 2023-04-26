import 'package:fitness_app/home/bloc/exercics_cubit/exercics_cubit.dart';
import 'package:fitness_app/home/bloc/programer_cubit/programer_cubit.dart';
import 'package:fitness_app/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProgramerCubit(),
        ),
        BlocProvider(
          create: (context) => ExercicsCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      ),
    );
  }
}
