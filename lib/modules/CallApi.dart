import "Package:http/http.dart" as http;
import 'dart:convert';
import 'data.dart';
// import 'https://flutlab.io/root/app/web/Data.dart';

Future<dynamic> getData() async {
  String API_KEY = "159B05B9-C576-4BC3-A21B-9351383BDE5A";
  String url = "https://rest.coinapi.io/v1/exchanges";
  Map<String, String> header = {
    "X-CoinAPI-Key": API_KEY
  };
  var response = await http.get(Uri.parse(url), headers: header);
  var data = json.decode(response.body);
  var temp = data[0].toString();
  print("temp\n $temp");
  var list = DataFromJson(temp);
  print(list);
}
