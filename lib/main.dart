import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Interest Calculator App',
      home: SIForm(),
    );
  }
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  Widget getImageAsset(_path) {
    AssetImage assetImage = AssetImage(_path);
    Image logo = Image(image: assetImage, width: 125, height: 125);
    return Container(child: logo);
  }

  var _currentValue;
  var _currencies =['Naira', 'Dollars','Pounds', 'Others'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.monetization_on),
          title: Text("Simple Intrest App"),
          actions: <Widget>[
            Icon(Icons.laptop_mac)
          ],),
          
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: getImageAsset('images/money.png')),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Principal",
                  hintText: "Enter Principal e.g 1200"),
            ),
            Padding(
                padding: EdgeInsets.only(top:10, bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Rate of Intrest",
                      hintText: "In percent"),
                )),

            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10, bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Rate of Intrest",
                      hintText: "In percent"),
                )),

                DropdownButton(items: _currencies.map((String dropDownItem){
                  return DropdownMenuItem(value: dropDownItem,child: Text(dropDownItem),);
                }).toList(),
                onChanged: (selectedValue){
                  setState(() {
                         _currentValue = selectedValue;             
                                    });
                },
                value: _currentValue,
                )


            ],)
          ],
        ),
      ),
    );
  }
}
