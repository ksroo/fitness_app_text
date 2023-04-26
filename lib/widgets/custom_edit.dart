import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_size_box.dart';
import 'package:flutter/material.dart';

class CustomEdit extends StatelessWidget {
  final void Function() onPressed;
  final bool isProgram;
  final String initialValue;

  final ValueChanged<String> onChanged;
  const CustomEdit({
    Key? key,
    required this.onPressed,
    required this.isProgram,
    required this.initialValue,
required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(isProgram ? 'Edit Program' : 'Add Exercise',
            style: Theme.of(context).textTheme.bodyLarge),
        const CustomSizedBox(height: 0.015, width: 1),
        TextFormField(
          autofocus: true,
          initialValue: initialValue ,
          onChanged: onChanged,
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
              labelText: 'Edit',
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
