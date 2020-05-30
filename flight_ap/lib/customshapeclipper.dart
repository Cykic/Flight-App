import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
  Path path = Path();
  path.lineTo(0.0, size.height);

  var firstEPoint = Offset(size.width*.5,size.height -35.0);
  var firstCPoint = Offset(size.width*0.25, size.height-50);

  var secondEPoint = Offset(size.width,size.height -88.0);
  var secondCPoint = Offset(size.width*0.75, size.height-10);


  path.quadraticBezierTo(firstCPoint.dx, firstCPoint.dy, firstEPoint.dx, firstEPoint.dy);
  path.quadraticBezierTo(secondCPoint.dx, secondCPoint.dy, secondEPoint.dx, secondEPoint.dy);
  
  path.lineTo(size.width, 0.0);
  path.close(); 
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}