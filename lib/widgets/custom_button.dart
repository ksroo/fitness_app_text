import 'package:flutter/material.dart';

class CustomElvatedBtn extends StatelessWidget {
  const CustomElvatedBtn({
    Key? key,
    required this.labelText,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.width,
    required this.height,
  }) : super(key: key);
  final String labelText;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          minimumSize: Size(MediaQuery.of(context).size.width * width,
              MediaQuery.of(context).size.height * height)),
      onPressed: onPressed,
      child: Text(
        labelText,
        style: TextStyle(
            color: foregroundColor, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
