import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/constants.dart';
import 'package:onatcipli_github_io/constants/dark_theme.dart';
import 'package:onatcipli_github_io/widgets/paint_triangel.dart';
import 'package:onatcipli_github_io/widgets/social_media_bar.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      PaintTriangle(backgroundColor: cardBackgroundColor),
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
                  width: width,
                  height: width,
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
                    textAlign: TextAlign.center,
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
                SizedBox(
                  height: 10,
                ),
                SocialMediaBar(
                  iconSizes: width / 5,
                ),
                Expanded(child: Container(),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('coming soon'),
                        CountdownFormatted(
                          duration: DateTime(2020).difference(DateTime.now()),
                          onFinish: () {
                            print('finished!');
                          },
                          builder: (BuildContext ctx, String remaining) {
                            return Text(
                              remaining,
                              style: Theme.of(context).textTheme.body1,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
