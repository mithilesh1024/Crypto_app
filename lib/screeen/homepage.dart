import 'package:crypto_app/modules/CallApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isScrollingDown = false;   //to check if user is scrolling

  var item = [    // items to be displayed on dropdownmenu
    'USD',
    'EUR',
    'BTC',
    'GBP',
  ];
  String dropdownvalue = 'USD';   // initial dropdownmenu item

  int i = 0;  // used to rotate about colors in colors list
  List<Color> colors = [Colors.cyan, Colors.blueAccent, Colors.deepOrange];   // icon color list

  // rotate through the list and return the next color
  Color getColor() {
    i = (i + 1) % colors.length;
    return colors[i];
  }

  // get the first letter of the name to be displayed on circle
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
      body: NestedScrollView(     //it is used to hide scrollbar when user starts to scroll
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
                  Navigator.of(context).pushNamed("/setting");    // used to navigate to settings page
                },
              ),
            ],
          ),
        ],
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 45,
              child: FutureBuilder(     // it will wait for the data to be ready
                  future: getData(),    // it will get data from api
                  builder: (context, snapshot){
                    if(snapshot.data != null){    //check if there is data
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  color: getColor(),
                                  borderRadius: BorderRadius.circular(55.0)   //to get circle
                              ),
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Text(
                                  nameFirstLetter(snapshot.data[index].name),   //function call to get first letter
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,    //color is letter
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              snapshot.data[index].name,    //name of crypto
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("\$${snapshot.data[index].rate}"),   //rate of crypto
                          );
                        },
                      );
                    }else{
                      return Center(    //it will center the below widget
                        child: CircularProgressIndicator(),   // CircularProgressIndicator will be displayed till the data is not received
                      );
                    }
                  }
              ),
            ),
            Positioned(   // bottom menu
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: MyApp.themeNotifier.value == ThemeMode.light?Colors.grey[200]:Colors.black   //change the color according to theme mode
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownvalue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: item.map((String items){   //display the values from list
                      return DropdownMenuItem(
                        value: items,
                        child: Center(child: Text(items,
                        style: TextStyle(
                          color: MyApp.themeNotifier.value == ThemeMode.light?Colors.black:Colors.white   //change the color according to theme mode
                        ),)),
                      );
                  }).toList(),
                    onChanged: (String newValue){
                      setState(() {
                        dropdownvalue=newValue;   //change the DropdownMenu value
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
