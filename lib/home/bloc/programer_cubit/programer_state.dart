part of 'programer_cubit.dart';

@immutable
abstract class ProgramerState {}

class ProgramerInitial extends ProgramerState {}



class ProgramerSuccessState extends ProgramerState {
  final List<ProgramModel> programList;

  ProgramerSuccessState(this.programList);
}
