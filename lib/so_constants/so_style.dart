import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_fonts.dart';
import 'package:liberty/so_constants/so_colors.dart';

const Color primaryColor = SoColors.primary;
const Color accentColor = SoColors.secondary;

final MaterialColor primarySwatch = SoColors.purple;
final MaterialColor accentSwatch = SoColors.pink;

final Color backgroundColor = Colors.white;

BorderRadius borderRadiusTop(Radius radius) => BorderRadius.only(topLeft: radius, topRight: radius);

BorderRadius borderRadiusBottom(Radius radius) => BorderRadius.only(bottomRight: radius, bottomLeft: radius);

BorderRadius borderRadiusLeft(Radius radius) => BorderRadius.only(topLeft: radius, bottomLeft: radius);

BorderRadius borderRadiusRight(Radius radius) => BorderRadius.only(topRight: radius, bottomRight: radius);

class SoTextStyle extends TextStyle{
  SoTextStyle.font({
    double fontSize,
    FontWeight fontWeight,
    Color color,
    bool isTitle
}) : super(
    inherit: false,
    color: color ?? (isTitle ? textBaseColor : subTitleColor),
    fontFamily: isTitle ? SoFonts.base : SoFonts.sub,
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: 0,
    wordSpacing: 0,
    textBaseline: TextBaseline.alphabetic
  );

  static final Color textBaseColor = Colors.black;
  static final Color titleColor = textBaseColor;
  static final Color subTitleColor = Color(0xC4C4C4);
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight bold = FontWeight.w600;

}