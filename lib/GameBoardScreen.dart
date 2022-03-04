import 'package:flutter/material.dart';
import 'package:session2_flutter_c5_alex/GameButton.dart';
import 'package:session2_flutter_c5_alex/GameHome.dart';

class GameBoardScreen extends StatefulWidget {
  static String ROUTE_NAME='GameBoard';

  @override
  State<StatefulWidget> createState() {
    return _GameBoardScreenState();
  }
}

class _GameBoardScreenState extends State<GameBoardScreen>{

    List<String> borad=[
      '','','',
      '','','',
      '','','',
    ];
   int player1Score=0;
   int player2Score=0;

  @override
  Widget build(BuildContext context) {

    GameBoardScreenArguments args=ModalRoute.of(context).settings.arguments ;
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Score',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
            flex:1 ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${args.name1} :$player1Score',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text('${args.name2} :$player2Score',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(borad[0],onButtonClicked,0),
                GameButton(borad[1],onButtonClicked,1),
                GameButton(borad[2],onButtonClicked,2),
              ],
            ),
          ),
          Expanded(flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(borad[3],onButtonClicked,3),
                GameButton(borad[4],onButtonClicked,4),
                GameButton(borad[5],onButtonClicked,5),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(borad[6],onButtonClicked,6),
                GameButton(borad[7],onButtonClicked,7),
                GameButton(borad[8],onButtonClicked,8),
              ],
            ),
          )
        ],
      ),
    );
  }

  int counter=0;
  onButtonClicked(int index){
    if(borad[index].isNotEmpty) return;
    if(counter==8){
      print('in draw condtion');
      clearBoard();
      return ;
    }
    setState(() {
      if(counter %2==0){
        borad[index]='o';

      }else{
        borad[index]='x';
      }
    });
    if(checkWinner(borad[index])){
      print('in winner condtion');
      if(counter %2==0){
        player1Score++;
      }else{
      player2Score++;
      }
      clearBoard();
    }
    counter++;

  }
   void clearBoard(){
     borad=[
       '','','',
       '','','',
       '','','',
     ];
     counter=0;
     setState(() {

     });
   }
  bool checkWinner(String symbol) {
    if(borad[0]==symbol &&borad[4] ==symbol && borad[8]==symbol){
      return true;
    }
    if(borad[2]==symbol &&borad[4] ==symbol && borad[6]==symbol) {
      return true;
    }
    for(int i=0;i<=8;i=i+3){
      if(borad[i]==symbol &&borad[i+1] ==symbol && borad[i+2]==symbol){
        return true;
      }
    }
    for(int i=0;i<=2;i++){
      if(borad[i]==symbol &&borad[i+3] ==symbol && borad[i+6]==symbol){
        return true;
      }
    }
    return false;
  }
}
