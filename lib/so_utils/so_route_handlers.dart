import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:liberty/so_pages/downloads/downloads.dart';
import 'package:liberty/so_pages/favourites/favourites.dart';
import 'package:liberty/so_pages/home/home.dart';
import 'package:liberty/so_pages/login/login.dart';
import 'package:liberty/so_pages/player/player.dart';
import 'package:liberty/so_pages/profile/profile.dart';

class RouteHandlers{
  final initialHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return LoginPage();
    }
  );

  final downloadsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return DownloadsPage();
    }
  );

  final favouritesHandler = new Handler(
    handlerFunc:  (BuildContext context, Map<String, List<String>> params){
      return FavouritesPage();
    }
  );

  final homeHandler = new Handler(
    handlerFunc:  (BuildContext context, Map<String, List<String>> params){
      return HomePage();
    }
  );

  final playerHandler = new Handler(
    handlerFunc:  (BuildContext context, Map<String, List<String>> params){
      return PlayerPage();
    }
  );

  final profileHandler = new Handler(
    handlerFunc:  (BuildContext context, Map<String, List<String>> params){
      return ProfilePage();
    }
  );

  final notFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("Page not Found");
      /*final snackBar = SnackBar(content: Text("Sorry, there's no such page"));
      Scaffold.of(context).showSnackBar(snackBar);*/
    }
  );
}