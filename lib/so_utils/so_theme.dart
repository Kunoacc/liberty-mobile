import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_style.dart';
//import 'package:liberty/so_constants/so_colors.dart';
import 'package:liberty/so_components/so_text.dart';

class SoTheme extends InheritedWidget {
  const SoTheme({
    Key key,
    @required Widget child,
  })
      : assert(child != null),
        super(key: key, child: child);

  TextStyle get small => _text12Style;
  TextStyle get body1 => _text13Style;
  TextStyle get body2 => body1.copyWith(height: 1.5);
  TextStyle get body3 => _text14Style;
  TextStyle get bodyMedium => body1.copyWith(fontWeight: SoTextStyle.regular);
  TextStyle get bodyHint => body1.copyWith(color: Colors.grey);
  TextStyle get button => _text14MediumStyle;
  TextStyle get title => _header18Style;
  TextStyle get subhead1 => _text15MediumStyle;
  TextStyle get subhead1Bold => _text15BoldStyle;
  TextStyle get subhead1Light => _text15LightStyle;
  TextStyle get subhead2 => _text14Style;
  TextStyle get subhead3 => _text16Style;
  TextStyle get headline => _header20Style;

  TextStyle get display1 => _text20Style;
  TextStyle get display2 => _text24Style;
  TextStyle get display2Bold => _header24BoldStyle;
  TextStyle get display3 => _header28Style;
  TextStyle get display4 => _text32Style;
  TextStyle get display4Bold => _header32Style;

//  TextStyle get textfield => body1.copyWith(
//    color: MkColors.light_grey.withOpacity(.8),
//  );
//  TextStyle get textfieldLarge => subhead3.copyWith(
//    color: SoColors.light_grey.withOpacity(.8),
//  );

  TextStyle get _header18Style => fontRegular(18.0, true);
  TextStyle get _header20Style => fontRegular(20.0, true);
  TextStyle get _header24BoldStyle => fontBold(24.0, true).copyWith(height: 1.05);
  TextStyle get _header28Style => fontRegular(28.0, true);
  TextStyle get _header32Style => fontRegular(32.0, true);

  TextStyle get _text12Style => fontRegular(12.0, true);
  TextStyle get _text13Style => fontRegular(13.0, true);
  TextStyle get _text14Style => fontRegular(14.0, true);
  TextStyle get _text14MediumStyle => fontRegular(14.0, true);
  // TextStyle get _text15Style => mkFontRegular(15.0);
  TextStyle get _text15BoldStyle => fontBold(15.0, true);
  TextStyle get _text15LightStyle => fontLight(15.0, true);
  TextStyle get _text15MediumStyle => fontRegular(15.0, true);
  TextStyle get _text16Style => fontRegular(16.0, true);
  // TextStyle get _text16MediumStyle => mkFontMedium(16.0);
  // TextStyle get _text18Style => mkFontRegular(18.0);
  TextStyle get _text20Style => fontRegular(20.0, true);
  TextStyle get _text24Style => fontRegular(24.0, true);
  TextStyle get _text32Style => fontRegular(32.0, true);

  static SoTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(SoTheme) as SoTheme;
  }

  @override
  bool updateShouldNotify(SoTheme old) {
    return false;
  }
}