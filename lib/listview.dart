import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: getListView(),
    ));
  }
}

Widget getListView() {

  var listView = ListView(
    children: <Widget>[

      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful View"),
        trailing: Icon(Icons.wb_sunny ),
        onTap: () {debugPrint("Landscape Tapped");}
      
      ),
        ListTile(
        leading: Icon(Icons.laptop_mac),
        title: Text("Laptop"),
        onTap: () {debugPrint("Laptop Tapped");}
      
       ),
       ListTile(
        leading: Icon(Icons.phone_android),
        title: Text("Phone"),
        onTap: () {debugPrint("Phone Tapped");}
      
      )
    ],
  );
return listView;
} 