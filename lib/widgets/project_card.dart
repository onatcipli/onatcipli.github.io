import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/models/project_model.dart';
import 'package:onatcipli_github_io/widgets/social_media_bar.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel currentProject;

  const ProjectCard({Key key, this.currentProject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: currentProject.imageUrl != null
                    ? Card(
                        child: Image.network(
                          currentProject.imageUrl,
                        ),
                      )
                    : FittedBox(fit: BoxFit.fitWidth, child: FlutterLogo()),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  currentProject.name,
                  style: Theme.of(context).textTheme.title,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HoverButton(
                iconData: SocialMediaIcons.github_circled,
                url: 'https://github.com/onatcipli',
              ),
              HoverButton(
                iconData: SocialMediaIcons.github_circled,
                url: 'https://github.com/onatcipli',
              ),
            ],
          ),
        ],
      ),
    );
  }
}