import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCalculator extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;
  const ButtonCalculator({
    Key key,
    this.text,
    this.fillColor,
    this.textColor,
    this.textSize = 28,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: SizedBox(
          width: 60,
          height: 60,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                color: Color(0xff1e90ff),
                width: 1,
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: textSize,
                ),
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              callback(text);
            },
            color: fillColor != null ? Color(fillColor) : null,
          ),
        ),
      ),
    );
  }
}
