import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateful App",
      theme: ThemeData(primarySwatch: Colors.red),
      home: FavoriteCity(),
    );
  }
}

class FavoriteCity extends StatefulWidget {
  @override
  _FavoriteCityState createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text("Statefull App Example"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              TextField(
                cursorColor: Colors.red,
                onChanged: (String userInput) {
                  setState(() {
                    nameCity = userInput;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Your best city is $nameCity",
                    style: TextStyle(fontSize: 20.0,color: Colors.red),
                  ))
            ],
          ),
        ));
  }
}
