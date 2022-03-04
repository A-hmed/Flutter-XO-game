import 'package:flutter/material.dart';

class CalcualtorButton extends StatelessWidget {
  String digit;
  Function onDigitClicked;
  CalcualtorButton(this.digit,this.onDigitClicked);
  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed:  (){
          if(digit== '=')
            onDigitClicked();
          else
          onDigitClicked(digit);
        },
        child: Text(digit,style: TextStyle(fontWeight:FontWeight.bold,fontSize:25 ),),
      ),
    ));
  }
}
