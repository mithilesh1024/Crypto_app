import 'package:flutter/material.dart';

class TileIcon extends StatelessWidget {
  String name;
  int i=0;
  List<Color> colors = [Colors.cyan, Colors.blueAccent, Colors.deepOrange];

  TileIcon(
      this.name,
      );

  Color getColor() {
    i = (i+1) % colors.length;
    return colors[i];
  }

  String nameFirstLetter(String name) {
    String s = name.substring(0, 1).toUpperCase();
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(55.0)),
        height: 45.0,
        width: 45.0,
        child: Center(
          child: Text(nameFirstLetter(this.name),
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
    );
  }
}
