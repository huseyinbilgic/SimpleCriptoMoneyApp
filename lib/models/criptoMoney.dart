class CriptoMoney{
  int id;
  String symbol,name,description,color,iconurl;
  String price;
  CriptoMoney(int id,String symbol,String name,String description,String color,String iconurl,String price)
  {
    this.id=id;
    this.symbol=symbol;
    this.name=name;
    this.description=description;
    this.color=color;
    this.iconurl=iconurl;
    this.price=price;
  }
  CriptoMoney.fromJson(Map json) {
    id = json["id"];
    symbol = json["symbol"];
    name = json["name"];
    description = json["description"];
    color = json["color"];
    iconurl = json["iconUrl"];
    price = json["price"];
  }


}