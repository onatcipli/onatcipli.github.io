import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/shared/navigation/custom_navigator.dart';

class NavigatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: CustomNavigator.navigatorKey,
      onGenerateRoute: CustomNavigator.onGenerateRoute,
      initialRoute: 'home',
    );
  }
}
