import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/social_media_buttons_icons.dart';
import 'package:onatcipli_github_io/widgets/hover_detector.dart';

class SocialMediaBar extends StatelessWidget {
  final double iconSizes;

  const SocialMediaBar({Key key, this.iconSizes = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SocialMediaButton(
              iconSizes: iconSizes,
              iconData: SocialMediaButtons.github_circled),
          SocialMediaButton(
              iconSizes: iconSizes, iconData: SocialMediaButtons.stackoverflow),
          SocialMediaButton(
              iconSizes: iconSizes, iconData: SocialMediaButtons.twitter),
          SocialMediaButton(
              iconSizes: iconSizes, iconData: SocialMediaButtons.linkedin),
        ],
      ),
    );
  }
}

class SocialMediaButton extends StatefulWidget {
  final double iconSizes;
  final IconData iconData;

  const SocialMediaButton({
    Key key,
    @required this.iconSizes,
    @required this.iconData,
  }) : super(key: key);

  @override
  _SocialMediaButtonState createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HoverDetector(
        onHover: () {
          setState(() {
            isHover = true;
          });
        },
        onExit: () {
          setState(() {
            isHover = false;
          });
        },
        child: Icon(
          widget.iconData,
          size: widget.iconSizes,
          color: isHover ? theme.hoverColor : theme.iconTheme.color,
        ),
      ),
    );
  }
}
