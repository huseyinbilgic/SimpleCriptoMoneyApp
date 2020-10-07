import 'package:cripto_money/models/criptoMoney.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinDetail extends StatefulWidget {
  CriptoMoney coin;
  CoinDetail(this.coin);
  @override
  State<StatefulWidget> createState() => CoinDetailState(coin);
}

class CoinDetailState extends State {
  CriptoMoney coin;
  CoinDetailState(this.coin);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(coin.symbol),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    child: SvgPicture.network(
                      coin.iconurl,
                    ),
                    width: 150.0,
                    height: 150.0,
                  )),
              Text(
                coin.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(double.tryParse(coin.price).toStringAsFixed(2),
                    style: TextStyle(fontSize: 25.0)),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top:15.0,left: 8.0,right: 8.0),
                child: Text(getDesc(coin.description),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
              )),
            ],
          ),
        ));
  }
  getDesc(String desc){
    if(desc==null){
      return "No Description";
    }
    return desc;
  }
}
