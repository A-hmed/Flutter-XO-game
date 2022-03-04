import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
   String symbol;
   Function onButtonClicked;
   int index;
   GameButton(this.symbol,this.onButtonClicked,this.index);
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: (){
          onButtonClicked(index);
        },
        child: Text(symbol,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
      ),
    ));
  }
}
