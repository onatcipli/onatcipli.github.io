import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/constants.dart';
import 'package:onatcipli_github_io/constants/dark_theme.dart';
import 'package:onatcipli_github_io/constants/social_media_buttons_icons.dart';
import 'package:onatcipli_github_io/widgets/paint_triangel.dart';

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
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  CustomPaint(
                    foregroundPainter:
                        PaintTriangle(backgroundColor: backgroundColor),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(cardBackgroundImageUrl),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).cardColor,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
