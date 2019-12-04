import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/pages/about_view.dart';
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

  static List<RouteView> routes = [
    RouteView(
      name: 'about',
      child: AboutView(),
    ),
  ];
}
