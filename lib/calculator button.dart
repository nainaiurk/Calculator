// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
typedef void CalculatorButtonCallBack({String buttonText});
class CalculatorButton extends StatelessWidget {
  CalculatorButton({required this.text,required this.ontap});
  final String text;
  final CalculatorButtonCallBack ontap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            width: 0.5,
          )
        ),
        child: TextButton(
          onPressed: ()=> ontap(buttonText: text), 
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),      
    );
  }
}