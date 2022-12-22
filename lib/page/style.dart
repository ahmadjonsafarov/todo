import 'package:flutter/material.dart';

abstract class Style{
  Style._();
  // --- COLOR ----//
  static const buleColor=Colors.blue;
  static const redColors=Colors.red;
  static const whiteColor=Colors.white;
  static const transparentColor=Colors.transparent;
  // --- gradient ---//
  static  LinearGradient HomeGgradient=LinearGradient(
    begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
         Color(0xffF43F5E),
        Color(0xffF43F5E).withOpacity(0.7),
      ]
  );
  static  LinearGradient Ggradient=LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0x50F43F5E),
        Color(0x70F43F5E).withOpacity(0.7),
      ]
  );
  // --- textStyle -- //
  static const TextStyleNormal=TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white
  );

  static TextStylenormal({double fontsize=26,Color color=Colors.white})=>TextStyle(
    fontSize: fontsize,
    color: color,
    fontWeight: FontWeight.normal
  );
  static TextStyleBold({double fontsize=26,Color color=Colors.white,bool isDone=false})=>TextStyle(fontSize: fontsize,fontWeight: FontWeight.bold,color: color,decoration: isDone? TextDecoration.lineThrough:TextDecoration.none);
}