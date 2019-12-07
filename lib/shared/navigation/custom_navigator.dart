import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/pages/about_view.dart';
import 'package:onatcipli_github_io/pages/flutter_view.dart';
import 'package:onatcipli_github_io/shared/navigation/custom_page_route_builder.dart';
import 'package:onatcipli_github_io/shared/navigation/route_view.dart';

class CustomNavigator {
  static Route onGenerateRoute(RouteSettings settings) {
    for (RouteView routeView in routes) {
      if (routeView.name == settings.name) {
        return CustomPageRouteBuilder(
            routeName: routeView.name, child: routeView.child);
      }
    }
  }

  static Future<dynamic> pushNamed({String routeName}) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  static bool pop() {
    return navigatorKey.currentState.pop();
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static List<RouteView> routes = [
    RouteView(
      name: 'about',
      child: AboutView(),
    ),
    RouteView(
      name: 'flutter',
      child: FlutterView(),
    ),
  ];
}
