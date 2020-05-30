import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text("Dashboard"),
        leading: Icon(Icons.home),
        backgroundColor: Colors.red,
        actions: <Widget>[Icon(Icons.search, )],   
      ),
      body:getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("FAB clicked");
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        tooltip: "Add One More Item"
        ),
      ),
      ); 
  }
}


class Lansscape extends StatefulWidget {
  @override
  _LansscapeState createState() => _LansscapeState();
}

class _LansscapeState extends State<Lansscape> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

void showSnackBar(context, String item){  
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint("UNDONE!!");
      },
    )
  );
  Scaffold.of(context).showSnackBar(snackBar);
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
         leading: Icon(Icons.arrow_right, color: Colors.red,),
         title: Text(listItems[index],style: TextStyle(
           color: Colors.amber
        ),
         ),
         trailing:Icon(Icons.delete,color: Colors.red,), 
         onTap: (){ 
           showSnackBar(context, listItems[index]);
           }
      );     
    }
  ); 
  return listView;
}