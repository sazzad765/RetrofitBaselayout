import 'package:flutter/material.dart';
import 'package:flutter_retrofit/view/home/home_screen.dart';

class RouteName {
  // auth
  static String home = "/home";

}

Map<String, WidgetBuilder> routes({Object? arg}) => {

      RouteName.home: (context) => const HomeScreen(),
    };

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  final Function? builder =
      routes(arg: routeSettings.arguments)[routeSettings.name];
  if (builder != null) {
    final Route route = MaterialPageRoute(
        settings: routeSettings, builder: (context) => builder(context));
    return route;
  } else {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: Center(
                child: Text('Page not found for ${routeSettings.name}'),
              ),
            ));
  }
}
