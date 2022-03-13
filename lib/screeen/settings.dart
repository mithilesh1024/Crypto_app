import 'package:flutter/material.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  static bool _darkMode = false;
  static bool _androidView = false;

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
            Navigator.of(context).pop();
          },
        ),
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                    )
                  )
              ),
              child: ListTile(
                title: Text("Dark Mode"),
                trailing: Switch(
                  value: _darkMode,
                  onChanged: (bool){
                    setState(() {
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
                trailing: Switch(
                  value: _androidView,
                  onChanged: (bool){
                    setState(() {
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
