import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liberty/so_constants/so_colors.dart';
import 'package:liberty/so_constants/so_fonts.dart';
import 'package:liberty/so_utils/so_theme.dart';
import 'package:liberty/so_constants/so_style.dart';
import 'package:liberty/so_utils/so_router.dart';
import 'package:liberty/so_utils/so_route.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _AppState(){
    final router = new Router();
    SoRoutes.configureRoutes(router);
    SoRoute.route = router;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark
    ));

  }

  @override
  Widget build(BuildContext context) {
    MaterialApp app(BuildContext context) => new MaterialApp(
      title: 'Liberty Devotional',
      color: Colors.white,
      theme: new ThemeData(
        accentColor: accentColor,
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(color: Colors.black),
        textTheme: Theme.of(context).textTheme.copyWith(
          body1: Theme.of(context).textTheme.body1.merge(
            SoTheme.of(context).body1
          ),
          button: Theme.of(context).textTheme.button.merge(
            SoTheme.of(context).button
          )
        ),
        splashColor: Colors.transparent,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
          height: 32,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        fontFamily: SoFonts.sub,
        canvasColor: accentColor,
        bottomAppBarColor: primaryColor,
      ),
      initialRoute: SoRoutes.root,
      onGenerateRoute: SoRoute.route.generator,
    );

    return SoTheme(
      child: Builder(
        builder: (BuildContext context) {
          return app(context);
        },
      ),
    );
  }
}
