import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/constants.dart';
import 'package:onatcipli_github_io/constants/dark_theme.dart';
import 'package:onatcipli_github_io/constants/social_media_buttons_icons.dart';
import 'package:onatcipli_github_io/shared/navigation/custom_navigator.dart';
import 'package:onatcipli_github_io/widgets/paint_triangel.dart';
import 'package:onatcipli_github_io/widgets/social_media_bar.dart';

class DesktopView extends StatefulWidget {
  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 60, 0, 60),
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
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
                          height: width / 8,
                          width: width / 8,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).cardColor,
                            backgroundImage: NetworkImage(profileImageUrl),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Onat Çipli',
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Mobile Developer',
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ),
                        SocialMediaBar(iconSizes: 40,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 140, 40, 140),
            child: Card(
                elevation: 10,
                child: IconButton(
                  icon: Icon(SocialMediaButtons.instagram),
                  onPressed: () {},
                )),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 80, 80),
            child: Card(
              child: Navigator(
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
