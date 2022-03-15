// ignore_for_file: file_names, unused_import

import 'package:calculator/calculation.dart';
import 'package:calculator/calculator button.dart';
import 'package:calculator/calculator%20row.dart';
import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({required this.onTap});
  
  final CalculatorButtonCallBack onTap;
  final calculatorButtonRows = [
    ['7','8','9',Calculations.DIVIDE],
    ['4','5','6',Calculations.MULTIPLY],
    ['1','2','3',Calculations.SUBSTRACT],
    [Calculations.DOT,'0','00',Calculations.ADD],
    [Calculations.CLEAR,Calculations.EQUAL]

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: calculatorButtonRows.map((calculatorRowButtons){
        return CalculatorRow(
          buttons: calculatorRowButtons,
          ontap: onTap,
        );
      }
      ).toList()
    );
  }
}