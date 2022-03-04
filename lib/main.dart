import 'package:flutter/material.dart';
import 'package:session2_flutter_c5_alex/GameBoardScreen.dart';
import 'package:session2_flutter_c5_alex/GameHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameBoardScreen.ROUTE_NAME:(context)=>GameBoardScreen(),
        GameHome.ROUTE_NAME:(context)=>GameHome()
      },
      initialRoute: GameHome.ROUTE_NAME,
    );
  }
}





