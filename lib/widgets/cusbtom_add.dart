import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_size_box.dart';
import 'package:flutter/material.dart';

class CustomAdd extends StatelessWidget {
  final void Function() onPressed;
  final bool isProgram;
  final TextEditingController controller;
  const CustomAdd({
    Key? key,
    required this.onPressed,
    required this.isProgram,
    required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(isProgram ? 'Add Program' : 'Add Exercise',
            style: Theme.of(context).textTheme.bodyLarge),
        const CustomSizedBox(height: 0.015, width: 1),
        TextField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              label:
                  Text('Title', style: Theme.of(context).textTheme.bodyMedium),
              border:
                  const OutlineInputBorder(borderSide: BorderSide(width: 1))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomElvatedBtn(
              width: 0.2,
              height: 0.05,
              labelText: 'Add',
              onPressed: onPressed,
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
            ),
            CustomElvatedBtn(
              width: 0.2,
              height: 0.05,
              labelText: 'Cancel',
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}
