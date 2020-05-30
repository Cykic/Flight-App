import 'package:flight_ap/customshapeclipper.dart';
import 'package:flutter/material.dart';
import 'package:flight_ap/main.dart';

var flightCardBorderColor = Colors.grey;

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        title: Text("Search Result"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            FlightListTop(),
            SizedBox(
              height: 20,
            ),
            FlightListingBottom()
          ],
        ),
      ),
    );
  }
}

class FlightListTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
              height: 160,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstcolor, secondcolor]))),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        location[0],
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 20,
                      ),
                      Text(
                        location[1],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Icon(
                    Icons.import_export,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FlightListingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Best Deals for Next 6 Months",
            style: dropDItemStyle,
          ),
          SizedBox(
            height: 10,
          ),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard()
          
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 122,
            width: 390,
            decoration: BoxDecoration(
                border: Border.all(color: flightCardBorderColor),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(' \$4,159.00',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 6,
                      ),
                      Text('(\$9,999.00)',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlightdetailChip(Icons.calendar_today, "Feb 2020"),
                      FlightdetailChip(Icons.flight_takeoff, "Jet Airways"),
                      FlightdetailChip(Icons.star, "4.4"),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0.0,
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[100]),
                child: Text(
                  '55%',
                  style:
                      TextStyle(color: priColor, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}

class FlightdetailChip extends StatelessWidget {
  final IconData icon;
  final String text;

  FlightdetailChip(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RawChip(
        label: Text(text),
        labelStyle: TextStyle(color: Colors.black, fontSize: 12),
        backgroundColor: Colors.grey[10],
        avatar: Icon(
          icon,
          size: 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
