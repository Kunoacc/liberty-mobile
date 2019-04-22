import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SoColors{
  SoColors._();

  static const _basePrimary = 0x682C90;
  static const _baseSecondary = 0X9F1F63;
  static const _baseAccent = 0xFB6868;

  static final MaterialColor purple = MaterialColor(
    _basePrimary,
     <int, Color>{
       50: Colors.purple[50],
       100: Colors.purple[100],
       200: Colors.purple[200],
       300: Colors.purple[300],
       400: Colors.purple[400],
       500: Colors.purple[500],
       600: Colors.purple[600],
       700: Colors.purple[700],
       800: Color(_basePrimary),
       900: Colors.purple[900]
    }
  );

  static final MaterialColor pink = MaterialColor(
    _baseSecondary,
    <int, Color>{
      50: Colors.pink[50],
      100: Colors.pink[100],
      200: Colors.pink[200],
      300: Colors.pink[300],
      400: Colors.pink[400],
      500: Colors.pink[500],
      600: Colors.pink[600],
      700: Colors.pink[700],
      800: Color(_baseSecondary),
      900: Colors.pink[900]
    }
  );


  static const Color primary = const Color(_basePrimary);
  static const Color secondary = const Color(_baseSecondary);
  static const Color accent = const Color(_baseAccent);
}