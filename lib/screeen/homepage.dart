import 'package:crypto_app/modules/CallApi.dart';
import 'package:crypto_app/modules/Tile_Icon.dart';
import 'package:crypto_app/modules/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController _scrollController;
  bool isScrollingDown = false;
  bool _showAppbar = true;

  var item = [
    'USD',
    'EUR',
    'BTC',
    'GBP',
  ];
  String dropdownvalue = 'USD';

  int i = 0;
  List<Color> colors = [Colors.cyan, Colors.blueAccent, Colors.deepOrange];

  Color getColor() {
    i = (i + 1) % colors.length;
    return colors[i];
  }

  String nameFirstLetter(String name) {
    String s = name.substring(0, 1).toUpperCase();
    return s;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.pink,
            title: Text("Crypto App"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamed("/setting");
                },
              ),
            ],
          ),
        ],
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 45,
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot){
                    if(snapshot.data != null){
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          print(snapshot.data[index].name);
                          print(snapshot.data[index].rate);
                          return ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  color: getColor(),
                                  borderRadius: BorderRadius.circular(55.0)),
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Text(
                                  nameFirstLetter(snapshot.data[index].name),
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              snapshot.data[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("\$${snapshot.data[index].rate}"),
                          );
                        },
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: MyApp.themeNotifier.value == ThemeMode.light?Colors.grey[200]:Colors.black
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownvalue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: item.map((String items){
                      return DropdownMenuItem(
                        value: items,
                        child: Center(child: Text(items,
                        style: TextStyle(
                          color: MyApp.themeNotifier.value == ThemeMode.light?Colors.black:Colors.white
                        ),)),
                      );
                  }).toList(),
                    onChanged: (String newValue){
                      setState(() {
                        dropdownvalue=newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
