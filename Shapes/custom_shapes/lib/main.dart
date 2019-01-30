import 'package:flutter/material.dart';
void main() => runApp(HomePage());
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Shapes'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomPaint(
            painter: ShapesPainter(),
            child: Container(height: 700,),
          ),
        ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = Colors.deepOrange;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);

    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 75.0, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}