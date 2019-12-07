import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/shared/navigation/custom_navigator.dart';

class NavigationBar extends StatelessWidget {
  final double size;

  const NavigationBar({
    Key key,
    @required this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size / 4,
          ),
          GestureDetector(
            onTap: () {
              CustomNavigator.pushNamed(routeName: 'about');
            },
            child: CustomTab(
              size: size,
              text: 'About',
              iconData: Icons.person,
            ),
          ),
          GestureDetector(
            onTap: () {
              CustomNavigator.pushNamed(routeName: 'flutter');
            },
            child: CustomTab(
              size: size,
              text: 'Flutter',
              child: FlutterLogo(),
            ),
          ),
          CustomTab(
            size: size,
            text: 'Photos',
            iconData: Icons.landscape,
          ),

          /*
          IconButton(
            icon: Icon(SocialMediaButtons.instagram),
            onPressed: () {},
          ),
          */
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final double size;

  final String text;

  final IconData iconData;

  final Widget child;

  const CustomTab({
    Key key,
    @required this.size,
    @required this.text,
    this.iconData,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: size / 4,
        ),
        iconData == null
            ? child
            : Icon(
                iconData,
                size: size,
              ),
        SizedBox(
          height: size / 4,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            text,
          ),
        ),
        SizedBox(
          height: size / 4,
        ),
      ],
    );
  }
}
