import 'dart:convert';

List<Data> DataFromJson(String str) =>
    List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String DataToJson(List<Data> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
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
        "data_start":
            "${dataStart.year.toString().padLeft(4, '0')}-${dataStart.month.toString().padLeft(2, '0')}-${dataStart.day.toString().padLeft(2, '0')}",
        "data_end":
            "${dataEnd.year.toString().padLeft(4, '0')}-${dataEnd.month.toString().padLeft(2, '0')}-${dataEnd.day.toString().padLeft(2, '0')}",
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
