import 'package:flutter/material.dart';
import 'package:translate_module/screens/terms_and_condition_scren.dart';

/// [_currentRoute] is the current route of the application
String _currentRoute = '/';

/// [currentRoute] is the current route of the application
String get currentRoute => _currentRoute;

/// [currentRoute] is the current route of the application
set currentRoute(String route) => _currentRoute = route;

/// [AppRoutes] is the class that contains all the routes for the application
class AppRoutes {
  /// Routes for the application
  /// root route is the first route that is called when the application
  /// is launched
  static const String root = "/";

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MyTermsAndConditionsScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
