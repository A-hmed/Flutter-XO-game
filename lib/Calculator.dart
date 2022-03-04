import 'package:flutter/material.dart';
import 'package:session2_flutter_c5_alex/CalcualtorButton.dart';

class Calcualtor extends StatefulWidget {
  @override
  _CalcualtorState createState() => _CalcualtorState();
}

class _CalcualtorState extends State<Calcualtor> {
  String result='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcualtor'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Text('${result==''?'0.0':result}',textAlign: TextAlign.start,style: TextStyle(fontSize: 30),),
            ],
          )),
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcualtorButton('7',onDigitClicked),
                  CalcualtorButton('8',onDigitClicked),
                  CalcualtorButton('9',onDigitClicked),
                  CalcualtorButton('+',onOperatorClicked),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcualtorButton('4',onDigitClicked),
                CalcualtorButton('5',onDigitClicked),
                CalcualtorButton('6',onDigitClicked),
                CalcualtorButton('-',onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcualtorButton('1',onDigitClicked),
                CalcualtorButton('2',onDigitClicked),
                CalcualtorButton('3',onDigitClicked),
                CalcualtorButton('*',onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcualtorButton('.',onDigitClicked),
                CalcualtorButton('0',onDigitClicked),
                CalcualtorButton('=',onEqualClick),
                CalcualtorButton('/',onOperatorClicked),
              ],
            ),
          ),
        ],
      ),
    );
  }
  String lhs='';
  String operator='';
  void onDigitClicked(String digit){
   setState(() {
     result+=digit;
   });
  }
  void onOperatorClicked(String operatorClicked){
   if(lhs.isEmpty){
     lhs=result;
   }else{
     String rhs=result;
     lhs=calcualte(lhs,operator,rhs).toString();
   }

   result='';
   setState(() {

   });
   operator=operatorClicked;
  }
  void onEqualClick(){
    print('lhs is $lhs , result is $result , operator is $operator');
    if(lhs.isEmpty || result.isEmpty || operator.isEmpty) return;
    result=calcualte(lhs,operator,result).toString();
    lhs='';
    setState(() {});
  }
  double calcualte(String lhs, String operator, String rhs) {
    double lhsAsDouble=double.parse(lhs);
    double rhsAsDouble=double.parse(rhs);

    if(operator=='+'){
      return lhsAsDouble +rhsAsDouble;
    }else if(operator == '-'){
      return lhsAsDouble -rhsAsDouble;
    }else if(operator == '*'){
      return lhsAsDouble *rhsAsDouble;
    }else if(operator == '/'){
      return lhsAsDouble /rhsAsDouble;
    }
  }
}
