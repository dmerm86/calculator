import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ButtonCalculator.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  String _recording = '';
  String _decision = '';

  void numClick(String text) {
    setState(() {
      _decision += text;
    });
  }

  void clearAll(String text) {
    setState(() {
      _recording = '';
      _decision = '';
    });
  }

  void clear(String text) {
    setState(() {
      _recording = '';
    });
  }

  void equality(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_decision);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _recording = _decision;
      _decision = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кальк',
      home: Scaffold(
        backgroundColor: Color(0xff283637),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Text(
              _recording,
              style: GoogleFonts.rubik(
                color: Colors.blueAccent,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            alignment: Alignment(1, 1),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              _decision,
              style: GoogleFonts.rubik(
                color: Color(0xff00bfff),
                textStyle: TextStyle(fontSize: 48),
              ),
            ),
            alignment: Alignment(1, 1),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCalculator(
                text: 'AC',
                textSize: 20,
                callback: clearAll,
              ),
              ButtonCalculator(
                text: 'C',
                textSize: 30,
                callback: clear,
              ),
              ButtonCalculator(
                text: '%',
                textSize: 30,
                callback: numClick, // как заставить работать процент
              ),
              ButtonCalculator(
                text: '/',
                textSize: 30,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCalculator(
                text: '7',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '8',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '9',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '*',
                callback: numClick,
                textSize: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCalculator(
                text: '4',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '5',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '6',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '-',
                callback: numClick,
                textSize: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCalculator(
                text: '1',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '2',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '3',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '+',
                callback: numClick,
                textSize: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCalculator(
                text: '.',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '0',
                callback: numClick,
              ),
              ButtonCalculator(
                text: '00',
                callback: numClick,
                textSize: 22,
              ),
              ButtonCalculator(
                text: '=',
                callback: equality,
                textSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
