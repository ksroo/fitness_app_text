import 'package:fitness_app/widgets/cusbtom_add.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/programer_cubit/programer_cubit.dart';



class AddButtons extends StatefulWidget {
  const AddButtons({
    super.key,
  });

  @override
  State<AddButtons> createState() => _AddButtonsState();
}

class _AddButtonsState extends State<AddButtons> {
  TextEditingController programController = TextEditingController();

  @override
  void dispose() {
    programController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomElvatedBtn(
            labelText: "Add Programer",
            onPressed: () {
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: CustomAdd(
                          onPressed: () {
                            _addProgram(context);
                          },
                          isProgram: true,
                          controller: programController,
                          
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: Colors.pink,
            foregroundColor: Colors.black,
            width: 0.38,
            height: 0.05,
          ),
          CustomElvatedBtn(
            labelText: "Add Exercics",
            onPressed: () {},
            backgroundColor: Colors.pink,
            foregroundColor: Colors.black,
            width: 0.38,
            height: 0.05,
          ),
        ],
      ),
    );
  }

  void _addProgram(BuildContext context) {
            context.read<ProgramerCubit>().addProgram(
          name: programController.text,
          id: programController.text.hashCode,
        );
    Navigator.of(context).pop();
    programController.clear();
  }
}
