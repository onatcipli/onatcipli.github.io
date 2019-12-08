import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
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
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.github_circled,
            url: 'https://github.com/onatcipli',
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.stackoverflow,
            url: 'https://stackoverflow.com/users/10685785/cipli-onat',
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.twitter,
            url: 'https://twitter.com/CipliOnat',
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.linkedin,
            url: 'https://www.linkedin.com/in/onat-%C3%A7ipli/',
          ),
          HoverButton(
            iconSizes: iconSizes,
            iconData: SocialMediaIcons.medium,
            url: 'https://medium.com/@ciplionat35',
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
    Key key,
    @required this.iconSizes,
    @required this.iconData,
    @required this.url,
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
            size = widget.iconSizes + 20;
          });
        },
        onExit: () {
          setState(() {
            isHover = false;
            size = widget.iconSizes;
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
