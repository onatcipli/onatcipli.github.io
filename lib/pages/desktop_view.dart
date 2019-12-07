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
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 60, 0, 60),
            child: LayoutBuilder(
              builder: (context, constrains) {
                if (constrains.maxWidth > 250) {
                  return UserCard(
                    width: 200,
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
              if (constrains.maxWidth > 160) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 140, 30, 140),
                  child: NavigationBar(size: 35),
                );
              }else {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 140, 20, 140),
                  child: NavigationBar(size: 25,),
                );
              }
            },
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 80, 80),
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