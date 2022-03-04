import 'package:flutter/material.dart';
import 'package:session2_flutter_c5_alex/GameBoardScreen.dart';

class GameHome extends StatelessWidget {
 static String ROUTE_NAME='GameHome';
  String player1='';
  String player2='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
         TextField(
           onChanged: (text){
             player1=text;
           },
           decoration: InputDecoration(
             labelText: 'Player 1 Name'
           ),
         ),
          TextField(
            onChanged: (text){
              player2=text;
            },
            decoration: InputDecoration(
                labelText: 'Player 2 Name'
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, GameBoardScreen.ROUTE_NAME
                ,arguments:GameBoardScreenArguments(player1,player2) );
          }, child: Text('Start'))
        ],
      ),
    );
  }
}
class GameBoardScreenArguments{
  String name1;
  String name2;
  GameBoardScreenArguments(this.name1,this.name2);

}