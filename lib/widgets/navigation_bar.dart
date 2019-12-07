import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/shared/navigation/custom_navigator.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              CustomNavigator.pushNamed(routeName: 'about');
            },
            child: Tab(
              icon: Icon(Icons.person),
              text: 'About',
            ),
          ),
          GestureDetector(
            onTap: (){
              CustomNavigator.pushNamed(routeName: 'flutter');
            },
            child: Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlutterLogo(),
                  Text('Flutter')
                ],
              ),
            ),
          ),
          Tab(
            icon: Icon(Icons.landscape),
            text: 'Photos',
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
