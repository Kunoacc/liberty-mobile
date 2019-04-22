import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_style.dart' show SoTextStyle;

TextStyle font(double fontSize, Color color) =>
    SoTextStyle.font(fontSize: fontSize, color: color);

TextStyle fontSize(double fontSize) => SoTextStyle.font(fontSize: fontSize);

TextStyle fontColor(Color color) => SoTextStyle.font(color: color);

TextStyle fontLight(double fontSize, bool isTitle, [Color color]) =>
    SoTextStyle.font(fontSize: fontSize,
        color: color ?? SoTextStyle.textBaseColor,
        fontWeight: SoTextStyle.light,
        isTitle: isTitle
    );

TextStyle fontRegular(double fontSize, bool isTitle, [Color color]) =>
    SoTextStyle.font(
      fontWeight: SoTextStyle.regular,
      fontSize: fontSize,
      color: color ?? SoTextStyle.textBaseColor,
      isTitle: isTitle
    );

TextStyle fontBold(double fontSize, bool isTitle, [Color color]) =>
    SoTextStyle.font(
      fontWeight: SoTextStyle.bold,
      fontSize: fontSize,
      color: color ?? SoTextStyle.textBaseColor,
      isTitle: isTitle
    );

class SoText{
  const SoText({
    Key key,
    @required String text
}) : assert(text != null), text = text;

  final String text;

  Text titleText() => Text(text,
  style: fontBold(24, true)
  );

  Text appBarText() => Text(text,
    style: fontBold(20, true),
  );

  Text subText() => Text(text,
    style: fontBold(14, false),
  );
}



