
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItem = [];

  CustomAppBar() {
    bottomBarItem.add(BottomNavigationBarItem(
        activeIcon: Icon(Icons.home,color: Colors.orange,),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.black),
        )));

    bottomBarItem.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "Watchlist",
          style: TextStyle(color: Colors.black),
        )));

bottomBarItem.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: TextStyle(color: Colors.black),
        )));

bottomBarItem.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        )));


  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 15,
          child: BottomNavigationBar(
        items: bottomBarItem,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
