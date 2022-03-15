// ignore_for_file: dead_code, constant_identifier_names, unnecessary_new

import 'package:calculator/number_formatter.dart';

class Calculations{
  static const DOT = '.';
  static const MULTIPLY = '*';
  static const SUBSTRACT = '-';
  static const ADD = '+';
  static const DIVIDE = '/';
  static const EQUAL = '=';
  static const CLEAR = 'CLEAR';
  static const OPERATIONS = [
    Calculations.ADD,
    Calculations.MULTIPLY,
    Calculations.SUBSTRACT,
    Calculations.DIVIDE,
    Calculations.CLEAR,
  ];
  static double add(double a, double b) => a+b;
  static double multiply(double a, double b) => a*b;
  static double substract(double a, double b) => a-b;
  static double divide(double a, double b) => a/b;
}
class Calculator{
  static String parseString(String text){
    List<String> numbersToAdd;
    double a,b,result;
    if(text.contains(Calculations.ADD))
    {
      numbersToAdd=text.split(Calculations.ADD);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);
      result = Calculations.add(a, b);
    }
    else if(text.contains(Calculations.MULTIPLY))
    { 
      numbersToAdd=text.split(Calculations.MULTIPLY);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);
      result = Calculations.multiply(a, b);
    }
    else if(text.contains(Calculations.DIVIDE))
    {
      numbersToAdd=text.split(Calculations.DIVIDE);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);
      result = Calculations.divide(a, b);
    }
    else if(text.contains(Calculations.SUBSTRACT))
    {
      numbersToAdd=text.split(Calculations.SUBSTRACT);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);
      result = Calculations.substract(a, b);
    }
    else{
      return text;
    }
    return NumberFormatter.format(result.toString());
  }
  static String addPeriod(String calculatorString){
    if (calculatorString.isEmpty){
      return calculatorString = '0${Calculations.DOT}';
    }
    RegExp exp = new RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString)? 2:1;

    return matches.length == maxMatches
        ? calculatorString
        : calculatorString += Calculations.DOT;
  }
  static bool includesOperation(String calculatorString){
    for( var operations in Calculations.OPERATIONS){
      if (calculatorString.contains(operations)){
        return true;
      }
    }
    return false;
  }
}