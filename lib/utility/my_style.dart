import 'package:flutter/material.dart';

class MyStyle {
  Color darkenColor = Color(0xff000000);
  Color redColor = Color(0xffff0922);
  Color blueColor = Color(0xff003dc3);
  Color lightblueColor = Color(0xff4fb6ff);
  Color primaryColor = Color(0xffffe7e7);
  Color lightenColor = Color(0xffffabbd);
  Color lightColor = Color(0xffffffff);

  TextStyle darkenStyle() => TextStyle(color: darkenColor);
  TextStyle redStyle() => TextStyle(color: redColor);
  TextStyle red2Style() =>
      TextStyle(color: redColor, fontWeight: FontWeight.w700, fontSize: 16);
  TextStyle blueStyle() => TextStyle(color: blueColor);
  TextStyle blue2Style() =>
      TextStyle(color: blueColor, fontWeight: FontWeight.w700, fontSize: 16);
  TextStyle whiteStyle() => TextStyle(color: Colors.white);

   BoxDecoration paintBackground() => BoxDecoration(
        color: Colors.white.withOpacity(0.3),
      );

  Widget showLogo() => Image.asset('images/logo3.png');
  
  BoxDecoration gradientRadioBackground() => BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.5),
          radius: 1.5,
          colors: [Colors.black, Colors.black],
        ),
      );

  SafeArea buildBackground(double screenWidth, double screenHeight) {
    return SafeArea(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('images/top1.png'),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('images/top2.png'),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('images/bottom1.png'),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('images/bottom2.png'),
            ),
          ],
        ),
      ),
    );
  }

  MyStyle();
}
