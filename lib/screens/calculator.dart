import 'package:calculadora_flutter/components/display.dart';
import 'package:calculadora_flutter/components/keyboard.dart';
import 'package:calculadora_flutter/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp
      ]
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Column(
      children: [
        Display(memory.value),
        Keyboard(_onPressed),
      ],
    ));
  }
}
