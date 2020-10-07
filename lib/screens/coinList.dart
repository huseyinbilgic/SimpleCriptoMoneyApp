import 'dart:convert';
import 'dart:ui';

import 'package:cripto_money/api/api.dart';
import 'package:cripto_money/models/criptoMoney.dart';
import 'package:cripto_money/screens/coinDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CoinListState();
}

class CoinListState extends State {
  List<CriptoMoney> list = new List<CriptoMoney>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Coins"),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position) {
              //c=Color(int.tryParse());

              return Card(child: getPicture(position));
            }));
  }

  getPicture(int position) {
    List coins = [8, 13, 28, 35, 41, 43];
    if (!coins.contains(position)) {
      return ListTile(
          onTap: () {
            goToDetail(list[position]);
          },
          title: Text(
            list[position].symbol,
            style: TextStyle(
                color: setColor(list[position].color),
                fontWeight: FontWeight.bold),
          ),
          leading: Container(
            child: SvgPicture.network(list[position].iconurl),
            width: 50.0,
            height: 50.0,
            

            //color: Colors.yellow
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              double.tryParse(list[position].price).toStringAsFixed(2),
              style: TextStyle(
                  color: setColor(list[position].color), fontSize: 20.0),
            ),
          ));
    }
    return null;
  }

  Color setColor(String a) {
    int c = 0xff54eadd;
    if (a != null) {
      if (!a.contains("000")) {
        String b = a.replaceAll("#", "0xff");
        c = int.parse(b);
      }
    }
    return Color(c);
  }

  getCoins() {
    Api.getCoins().then((response) {
      setState(() {
        Iterable list = (json.decode(response.body))["data"]["coins"];
        this.list = list.map((coin) => CriptoMoney.fromJson(coin)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCoins();
  }

  void goToDetail(CriptoMoney coin) async {
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CoinDetail(coin))); //bir sayfadan diğerine gitmek için
    /*     
    if (result != null) {
      if (result) {
        getCoins();
      }
    }
    */
  }
}
