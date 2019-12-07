import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/shared/navigation/custom_navigator.dart';
import 'package:onatcipli_github_io/widgets/navigation_bar.dart';
import 'package:onatcipli_github_io/widgets/user_card.dart';

class DesktopView extends StatefulWidget {
  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 60, 0, 60),
            child: LayoutBuilder(
              builder: (context, constrains) {
                if (constrains.maxWidth > 450) {
                  return UserCard(
                    width: 210,
                  );
                } else if (constrains.maxWidth > 350) {
                  return UserCard(
                    width: 190,
                  );
                } else if (constrains.maxWidth > 250) {
                  return UserCard(
                    width: 175,
                  );
                } else if (constrains.maxWidth > 200) {
                  return UserCard(
                    width: 150,
                  );
                } else {
                  return UserCard(
                    width: 100,
                  );
                }
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth > 220) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(50, 140, 50, 140),
                  child: NavigationBar(size: 50),
                );
              } else if (constrains.maxWidth > 160) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 140, 30, 140),
                  child: NavigationBar(size: 35),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 140, 20, 140),
                  child: NavigationBar(
                    size: 25,
                  ),
                );
              }
            },
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 40, 80),
            child: Card(
              child: Navigator(
                key: CustomNavigator.navigatorKey,
                onGenerateRoute: CustomNavigator.onGenerateRoute,
                initialRoute: 'about',
              ),
              elevation: 5,
            ),
          ),
        ),
      ],
    );
  }
}
