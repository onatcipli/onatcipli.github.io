import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/widgets/user_card.dart';

class MobileView extends StatefulWidget {
  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constrains) {
          if (constrains.maxWidth > 400) {
            return UserCard(
              width: 350,
            );
          } else if (constrains.maxWidth > 250) {
            return UserCard(
              width: 200,
            );
          } else if (constrains.maxWidth > 200) {
            return UserCard(
              width: 150,
            );
          } else if (constrains.maxWidth > 150) {
            return UserCard(
              width: 100,
            );
          }  else if (constrains.maxWidth > 100) {
            return UserCard(
              width: 60,
            );
          } else {
            return UserCard(
              width: 50,
            );
          }
        },
      ),
    );
  }
}
