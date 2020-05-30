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
  var _currencies = ['Naira', 'Dollars', 'Pounds', 'Others'];
  var _currentItemSelected = 'Naira';
  
  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              DropdownButton(
                items: _currencies.map((dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected){
                  _onDropDownItemSelected(newValueSelected);
                },
                value: _currentItemSelected,
                hint: Text("Select Item"),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Your best city is $nameCity",
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  ))
            ],
          ),
        ));
  }
}
