// ignore_for_file: file_names, avoid_function_literals_in_foreach_calls

import 'package:calculator/calculator button.dart';
import 'package:flutter/material.dart';

class CalculatorRow extends StatelessWidget {
  CalculatorRow({required this.buttons, required this.ontap});

  final List<String> buttons;
  final CalculatorButtonCallBack ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rowButtons());
  }

  List<Widget> rowButtons() {
    List<Widget> allButtons = [];

    buttons.forEach((String buttonText) {
      allButtons.add(
        CalculatorButton(
          text: buttonText, 
          ontap: ontap
        )
      );
    });
    return allButtons;
  }
}
