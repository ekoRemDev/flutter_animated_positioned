import 'package:flutter/material.dart';

Widget PageBackground() {
  return Container(
//      decoration: new BoxDecoration(
//        color: Colors.purple[900].withOpacity(0.6),
////          image: new DecorationImage(
////            image: new AssetImage("assets/images/math_game_background.png"),  // TODO Customizable
////            fit: BoxFit.fill,
////          ),
//      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purple[800], Colors.purple[400]]))
  );
}




class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.65, size.width * 0.50, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.85,size.width * 1.0, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);

    var paint2 = Paint();
    paint2.color = Colors.amber[800];
    paint2.style = PaintingStyle.fill; // Change this to fill

    var path2 = Path();

    path2.moveTo(0, size.height * 0.80);
    path2.quadraticBezierTo(size.width * 0.25, size.height * 0.70, size.width * 0.50, size.height * 0.80);
    path2.quadraticBezierTo(size.width * 0.75, size.height * 0.90,size.width * 1.0, size.height * 0.80);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);






  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}