import 'package:flight_ap/customAppBar.dart';
import 'package:flight_ap/customshapeclipper.dart';
import 'package:flight_ap/flight_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlightApp',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: priColor));
  }
}

const TextStyle dropDTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDItemStyle = TextStyle(color: Colors.black, fontSize: 16.0);

List<String> location = ['Boston (BOS)', 'New York (JFK)'];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomAppBar(),
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopContainer(),
              BottomContainer(),
              BottomContainer()
            ],
          ),
        ));
  }
}

var priColor = Color(0xFFF3791A);
var firstcolor = Color(0xFFF47D15);
var secondcolor = Color(0xFFEF772C);
var selectedItem = 1;

class TopContainer extends StatefulWidget {
  @override
  TopContainerState createState() => TopContainerState();
}

class TopContainerState extends State<TopContainer> {
  var selectedItem = 1;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstcolor, secondcolor])),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        PopupMenuButton(
                          onSelected: (item) {
                            setState(() {
                              selectedItem = item;
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                location[selectedItem],
                                style: dropDTextStyle,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                            PopupMenuItem(
                                child: Text(
                                  location[0],
                                  style: dropDItemStyle,
                                ),
                                value: 0),
                            PopupMenuItem(
                                child: Text(
                                  location[1],
                                  style: dropDItemStyle,
                                ),
                                value: 1)
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.settings, color: Colors.white)
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Text("where would YOU\n want to go ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextField(
                        controller:
                            TextEditingController(text: location[selectedItem]),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              FlightListingScreen()));
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: ChoiceChip(
                            Icons.flight_takeoff, "Flights", isFlightSelected),
                        onTap: () {
                          setState(() {
                            isFlightSelected = true;
                          });
                        },
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        child: ChoiceChip(
                            Icons.hotel, 'Hotels', !isFlightSelected),
                        onTap: () {
                          setState(() {
                            isFlightSelected = false;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}

TextStyle viewallStyle = TextStyle(color: priColor, fontSize: 14);

class BottomContainer extends StatefulWidget {
  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Currently Watched Items',
                  style: dropDItemStyle,
                ),
                Text('VIEW ALL (12)', style: viewallStyle)
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cityCards,
            ),
          )
        ],
      ),
    );
  }
}

List<CardCity> cityCards = [
  CardCity("images/Athens.jpeg", "Athens", "Feb 2019", "90", "2500", "1000"),
  CardCity("images/greece.jpeg", "Greece", "Feb 2019", "79", "3500", "1520"),
  CardCity("images/Lasgos.jpeg", "Lagos", "Feb 2019", "15", "6586", "3500"),
  CardCity(
      "images/LasVegas.jpeg", "Las Vegas", "Feb 2019", "21", "15253", "10050"),
  CardCity("images/LosAngeles.jpeg", "Los Angeles", "Feb 2019", "32", "2500",
      "1000"),
];

class CardCity extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  CardCity(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210,
                  width: 160,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: 160,
                  height: 90,
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                        Colors.black,
                        firstcolor.withOpacity(0.5),
                        Colors.black.withOpacity(0.1)
                      ]))),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cityName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(monthYear,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 14))
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("$discount%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black))),
                      ]),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '\$$newPrice',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                " (\$$oldPrice)",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
