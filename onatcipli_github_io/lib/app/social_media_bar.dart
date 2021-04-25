import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/app/hover_detector.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class SocialMediaBar extends StatelessWidget {
  final double iconSizes;

  const SocialMediaBar({Key? key, this.iconSizes = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.github_circled,
            // url: currentUser.github,
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.stackoverflow,
            // url: currentUser.stackoverflow,
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.twitter,
            // url: currentUser.twitter,
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.linkedin,
            // url: currentUser.linkedin,
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.medium,
            // url: currentUser.medium,
          ),
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final double iconSizes;
  final IconData iconData;

  final String url;

  const HoverButton({
    Key? key,
    this.iconSizes = 20,
    required this.iconData,
    this.url = '',
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHover = false;
  double size = 20;

  @override
  void initState() {
    size = widget.iconSizes;
    super.initState();
  }

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
        child: SocialMediaButton(
          size: size,
          color: isHover ? theme.hoverColor : theme.iconTheme.color,
          iconData: widget.iconData,
          url: widget.url,
        ),
      ),
    );
  }
}
