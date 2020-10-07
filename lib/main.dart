



import 'package:cripto_money/screens/coinList.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CriptoMoneyApp(),
    );
  }
}

class CriptoMoneyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CriptoMoneyAppState();
}

class CriptoMoneyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return CoinList();
  }
}
