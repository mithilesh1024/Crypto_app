import 'package:crypto_app/secrets.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

// class Data{
//   String name;
//   // Map<String,String> amount;
//   // String quote;
//   String rate;
//
//   Data(
//       this.name,
//       this.rate,
//       );
//
//   // int setAmount(var type,var price){
//   //   this.amount[type] = price;
//   // }

// }

List<Data> DataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => new Data.fromJson(x)));

String DataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data{
  Data({
    this.exchangeId,
    this.website,
    this.name,
    this.dataStart,
    this.dataEnd,
    this.dataQuoteStart,
    this.dataQuoteEnd,
    this.dataOrderbookStart,
    this.dataOrderbookEnd,
    this.dataTradeStart,
    this.dataTradeEnd,
    this.dataSymbolsCount,
    this.volume1HrsUsd,
    this.volume1DayUsd,
    this.volume1MthUsd,
  });

  String exchangeId;
  String website;
  String name;
  DateTime dataStart;
  DateTime dataEnd;
  DateTime dataQuoteStart;
  DateTime dataQuoteEnd;
  DateTime dataOrderbookStart;
  DateTime dataOrderbookEnd;
  DateTime dataTradeStart;
  DateTime dataTradeEnd;
  int dataSymbolsCount;
  double volume1HrsUsd;
  double volume1DayUsd;
  double volume1MthUsd;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    exchangeId: json["exchange_id"],
    website: json["website"],
    name: json["name"],
    dataStart: DateTime.parse(json["data_start"]),
    dataEnd: DateTime.parse(json["data_end"]),
    dataQuoteStart: DateTime.parse(json["data_quote_start"]),
    dataQuoteEnd: DateTime.parse(json["data_quote_end"]),
    dataOrderbookStart: DateTime.parse(json["data_orderbook_start"]),
    dataOrderbookEnd: DateTime.parse(json["data_orderbook_end"]),
    dataTradeStart: DateTime.parse(json["data_trade_start"]),
    dataTradeEnd: DateTime.parse(json["data_trade_end"]),
    dataSymbolsCount: json["data_symbols_count"],
    volume1HrsUsd: json["volume_1hrs_usd"].toDouble(),
    volume1DayUsd: json["volume_1day_usd"].toDouble(),
    volume1MthUsd: json["volume_1mth_usd"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "exchange_id": exchangeId,
    "website": website,
    "name": name,
    "data_start": "${dataStart.year.toString().padLeft(4, '0')}-${dataStart.month.toString().padLeft(2, '0')}-${dataStart.day.toString().padLeft(2, '0')}",
    "data_end": "${dataEnd.year.toString().padLeft(4, '0')}-${dataEnd.month.toString().padLeft(2, '0')}-${dataEnd.day.toString().padLeft(2, '0')}",
    "data_quote_start": dataQuoteStart.toIso8601String(),
    "data_quote_end": dataQuoteEnd.toIso8601String(),
    "data_orderbook_start": dataOrderbookStart.toIso8601String(),
    "data_orderbook_end": dataOrderbookEnd.toIso8601String(),
    "data_trade_start": dataTradeStart.toIso8601String(),
    "data_trade_end": dataTradeEnd.toIso8601String(),
    "data_symbols_count": dataSymbolsCount,
    "volume_1hrs_usd": volume1HrsUsd,
    "volume_1day_usd": volume1DayUsd,
    "volume_1mth_usd": volume1MthUsd,
  };
}


Future<dynamic> getData () async {
  // List<Data> coinRate=[];
  // List base = [];
  // List quotes = [];

  String url="https://rest.coinapi.io/v1/exchanges";
  Map<String,String> header = {"X-CoinAPI-Key": API_KEY};
  var response = await http.get(Uri.parse(url), headers: header);
  var data = json.decode(response.body);
  print(data);
  print(data[0]["exchange_id"]);
  // List<Data> coinRate = (new Data.fromJson(data[0])).toList();
  var list = DataFromJson(response.body);
  print(list);
  // coinRate.forEach((element) {
  //   print("${element.exchangeId}\n");
  // });



  // var data = json.decode(response.body);
  // print(data);
  // Data coinRate = new Data.fromJson(data);
  // print("sadasd");
  // print(coinRate);



  // data.forEach((element){
  //   print("${element["name"]}\n");
  //   var temp = new Data(element["name"],element["volume_1hrs_usd"]);
  //   coinRate.add(temp);
  // });


  // print("data\n");
  //
  // var temp = new Data(data["asset_id_base"]);
  //
  // data["rates"].forEach((element){
  //   print("${element["asset_id_quote"]}, ${element["rate"]}\n");
  //   temp.setAmount(element["asset_id_quote"], element["rate"]);
  // });

  // for(int i=0;i<2;i++){
  //   if(data[i].containsKey('name') && data[i].containsKey('price_usd')){
  //     var tname = data[i]["name"];
  //     var trate = data[i]["price_usd"];
  //     print("$i) $tname = $trate \n");
  //     var temp = new Data(tname,trate);
  //     coinRate.add(temp);
  //   }
  // }
  // var tname = data[0]["name"];
  // var trate = data[0]["price_usd"];
  // // print("$i) $tname = $trate \n");
  // var temp = new Data(tname,trate);
  // coinRate.add(temp);
  // data.forEach((element){
  //   var temp = new Data(element["name"],element["price_usd"]);
  //   print("++++++++++++++++++++++++++++++++++++++++++++");
  //   print(temp.name);
  //   print("\n");
  //   print(temp.rate);
  //   print("++++++++++++++++++++++++++++++++++++++++++++");
  //   coinRate.add(temp);
  // });

  // data.forEach((element) async {
  //   if (element["asset_id"] == "USD" || element["asset_id"] == "EUR" || element["asset_id"] == "BTC" || element["asset_id"] == "GBP"){
  //     var temp = new Data(element["name"],element["asset_id"]);
  //     String url2 = "https://rest.coinapi.io/v1/exchangerate/${element["asset_id"]}?invert=false";
  //     var response = await http.get(url2, headers: header);
  //     var data1 = json.decode(response.body);
  //     data1["rates"].forEach((element1){
  //       if (element1["asset_id_quote"] == "USD" || element1["asset_id_quote"] == "EUR" || element1["asset_id_quote"] == "CNY" || element1["asset_id_quote"] == "GBP"){
  //         temp.setAmount(element["asset_id_quote"],element1["rate"]);
  //       }
  //     });
  //     coinRate.add(temp);
  //   }
  // });
  // data["rates"].forEach((element){
  //   if (element["asset_id_quote"] == "USD" || element["asset_id_quote"] == "EUR" || element["asset_id_quote"] == "CNY" || element["asset_id_quote"] == "GBP"){
  //   Data temp = new Data(element["asset_id_quote"].toString(),element["rate"].toString());
  //   coinRate.add(temp);
  //   }
  // });
  // Data temp = new Data(data["asset_id_base"].toString(),data["asset_id_quote"].toString(),data["rate"].toString());
  // Data temp = new Data(data["asset_id_base"].toString(),{data["asset_id_quote"].toString():data["rate"].toString()});
  // print(data);
  // print(data["asset_id_base"]);
  // print("\n");
  // print(data["asset_id_quote"]);
  // print("\n");
  // print(data["rate"]);
  // print("sfsdfsdf");
  // print(coinRate[0].name);
  // return coinRate;

  // var name = [
  //   "Bitcoin",
  //   "Ethereum",
  //   "Ripple",
  //   "Bitcoin",
  //   "Ethereum",
  //   "Ripple",
  //   "Bitcoin",
  //   "Ethereum",
  //   "Ripple",
  //   "Bitcoin",
  //   "Ethereum",
  //   "Ripple"
  // ];
  // var amount = [
  //   "3231",
  //   "23213",
  //   "3221",
  //   "3231",
  //   "23213",
  //   "3221",
  //   "3231",
  //   "23213",
  //   "3221",
  //   "3231",
  //   "23213",
  //   "3221"
  // ];
  // print("List data");
  // for(int i=0;i<12;i++){
  //   var temp = new Data(name[i],amount[i]);
  //   coinRate.add(temp);
  // }
  return coinRate;
}