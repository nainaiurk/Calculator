// ignore_for_file: prefer_const_constructors

import 'package:calculator/all buttons.dart';
import 'package:calculator/calculation.dart';
import 'package:calculator/history.dart';
import 'package:calculator/number display.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations =[];
  List<String> calculations = [];
  String calculatorString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: <Widget>[
          IconButton(
            onPressed:() {
              _navigateAndDisplayHistory(context);
            }, 
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          NummberDisplay(value: calculatorString,),
          CalculatorButtons(onTap: _onPressed),
        ],
      ),
    );
  }
  _navigateAndDisplayHistory(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=> History(operations: calculations,)
      )
    );
    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }
  void _onPressed({String buttonText}){
    if (Calculations.OPERATIONS.contains(buttonText)){
      return setState(() {
        operations.add(buttonText);
        calculatorString += "$buttonText ";
      });
    }
    //on clear press
    if(buttonText == Calculations.CLEAR){
      return setState(() {
        operations.add(Calculations.CLEAR);
        calculatorString = "";
      });
    }
    //on equal press
    if(buttonText == Calculations.EQUAL){
      String newCalculatorString =  Calculator.parseString(calculatorString);
      return setState(() {
        if (newCalculatorString != calculatorString){
          calculations.add(calculatorString);
        }
      });
    }
    setState(() {
      if(!isNewEquation 
        && operations.length > 0 
        && operations.last == Calculations.EQUAL
      ){
        calculatorString = buttonText;
        isNewEquation = true;
      }
      else{
        calculatorString += buttonText;
      }
    });
  }
}