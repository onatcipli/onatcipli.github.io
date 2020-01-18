import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/constants.dart';
import 'package:onatcipli_github_io/constants/dark_theme.dart';
import 'package:onatcipli_github_io/widgets/paint_triangel.dart';
import 'package:onatcipli_github_io/widgets/social_media_bar.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required this.width = 150,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: width,
              height: width,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
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
                  iconSizes: width / 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
