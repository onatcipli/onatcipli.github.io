import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/social_media_buttons_icons.dart';

class MobileView extends StatefulWidget {
  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(SocialMediaButtons.instagram),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
