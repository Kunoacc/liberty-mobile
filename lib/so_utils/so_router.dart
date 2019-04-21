import 'package:fluro/fluro.dart';
import 'package:liberty/so_utils/so_route_handlers.dart';

class SoRoutes{
  static String root = '/';
  static String login = '/login';
  static String downloads = '/downloads';
  static String favourites = '/favourites';
  static String player = '/player';
  static String profile = '/profile';

  static void configureRoutes(Router router){
    final handlers = new RouteHandlers();
    router.notFoundHandler = handlers.notFoundHandler;
    router.define(root, handler: handlers.initialHandler);
    router.define(login, handler: handlers.initialHandler);
    router.define(downloads, handler: handlers.downloadsHandler);
    router.define(favourites, handler: handlers.favouritesHandler);
    router.define(player, handler: handlers.playerHandler);
    router.define(profile, handler: handlers.profileHandler);
  }

}