import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        leading: Icon(Icons.home),
           
      ),
      body:getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        tooltip: "Add One More Item"
        ),
      )
      );
  }
}


List<String> getListElement(){ 

var items = List<String>.generate(1000, (counter) => "Item $counter");
return items;
}

Widget getListView(){

  var listItems = getListElement();
 
  var listView = ListView.builder(
     itemBuilder: (context, index){
       return ListTile(
         leading: Icon(Icons.arrow_right),
         title: Text(listItems[index]),
         trailing:Icon(Icons.info), 
         onTap: () {debugPrint(listItems[index]);},
      );     
    }
  );
  return listView;
}