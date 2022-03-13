import 'package:flutter/material.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  static bool _darkMode = false;      // to check is dark mode is enabled or not
  static bool _androidView = false;   // to check if android view is enabled or not

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();    // pop the front page and go to the page behind
          },
        ),
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(  // Arrange widget in vertical direction
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(   //apply border only to bottom
                      color: Colors.black,
                    )
                  )
              ),
              child: ListTile(    // dark mode tile
                title: Text("Dark Mode"),
                trailing: Switch(     //it will be positioned at the end
                  value: _darkMode,   //value of dark mode
                  onChanged: (bool){
                    setState(() {
                      //if dark mode is enabled themeMode is changed to dark
                      //if dark mode is disabled themeMode is changed to light
                      if (_darkMode){
                        _darkMode=false;
                        MyApp.themeNotifier.value = ThemeMode.light;
                      }else{
                        _darkMode=true;
                        MyApp.themeNotifier.value = ThemeMode.dark;
                      }
                    });
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                      )
                  )
              ),
              child: ListTile(
                title: Text("Android View"),
                trailing: Switch(         //it will be positioned at the end
                  value: _androidView,    //value of android view
                  onChanged: (bool){
                    setState(() {
                      // enable or disable android view
                      if (_androidView){
                        _androidView=false;
                      }else{
                        _androidView=true;
                      }
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
