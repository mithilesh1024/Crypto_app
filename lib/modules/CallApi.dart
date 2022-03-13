import "Package:http/http.dart" as http;
import 'dart:convert';
import 'data.dart';

// dummy data structure
class Data1{
  String name;
  double rate;

  Data1(
      this.name,
      this.rate
      );
}

Future<dynamic> getData() async {
  // the api calls i tired but not working
  // String API_KEY = "159B05B9-C576-4BC3-A21B-9351383BDE5A";
  // String url = "https://rest.coinapi.io/v1/exchanges";
  // Map<String, String> header = {
  //   "X-CoinAPI-Key": API_KEY
  // };
  // var response = await http.get(Uri.parse(url), headers: header);
  // var data = json.decode(response.body);
  // var temp = data[0].toString();
  // var list = DataFromJson(temp);

  //++++++++++++++++++++++++TEST DATA++++++++++++++++++++++++++++++++

  List<String> name = ["Bitcoin","Ethereum","Ripple","Bitcoin Cash","Litecoin","NEO","Stellar","Cardano","Bitcoin Cash","Litecoin","NEO","Stellar"];
  List<double> amount = [9293.04,34.0943,12.0943,234.098,214.322,345.654,317.87,0.324,34.90,32.098,67.45,98.76];
  List<Data1> coinRate = [];
  for(int i=0;i<11;i++){
    var temp = new Data1(name[i],amount[i]);
    coinRate.add(temp);
  }
  return coinRate;
  //++++++++++++++++++++++++TEST DATA++++++++++++++++++++++++++++++++
}
