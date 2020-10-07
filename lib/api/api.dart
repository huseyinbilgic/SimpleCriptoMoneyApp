import "package:http/http.dart" as http;
class Api{
  static Future getCoins(){
    return http.get("https://api.coinranking.com/v1/public/coins");
  }
}