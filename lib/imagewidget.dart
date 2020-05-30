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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Intrest App")),
      body: Container(child:
        getImageAsset('images/money.png')
             ),
    );
  }
}
