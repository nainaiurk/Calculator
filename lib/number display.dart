// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class NummberDisplay extends StatelessWidget {
  
  NummberDisplay(
    {this.value: ''}
  );
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            value,style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}