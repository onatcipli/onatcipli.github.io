import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/social_media_buttons_icons.dart';
//import 'dart:html' as html;

class SocialMediaBar extends StatelessWidget {
  final double iconSizes;

  const SocialMediaBar({Key key, this.iconSizes = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          iconSize: iconSizes,
          icon: Icon(SocialMediaButtons.github_circled),
          onPressed: () {},
        ),
        IconButton(
          iconSize: iconSizes,
          icon: Icon(SocialMediaButtons.stackoverflow),
          onPressed: () {},
        ),
        IconButton(
          iconSize: iconSizes,
          icon: Icon(SocialMediaButtons.twitter),
          onPressed: () {
            //html.window.open("https://twitter.com/CipliOnat", "");
          },
        ),
        IconButton(
          iconSize: iconSizes,
          icon: Icon(SocialMediaButtons.linkedin),
          onPressed: () {},
        ),
      ],
    );
  }
}
