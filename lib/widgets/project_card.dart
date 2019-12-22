import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/models/project_model.dart';
import 'package:onatcipli_github_io/widgets/social_media_bar.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel currentProject;

  final double height;

  const ProjectCard({Key key, this.currentProject, this.height = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        color: Theme.of(context).backgroundColor,
        child:             Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 150,
                child: currentProject.imageUrl != null
                    ? Card(
                  child: Image.network(
                    currentProject.imageUrl,
                  ),
                )
                    : FittedBox(fit: BoxFit.fitWidth, child: FlutterLogo()),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    currentProject.name,
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 5,),
                  Text(currentProject.description ?? '')
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HoverButton(
                  iconData: SocialMediaIcons.github_circled,
                  url: currentProject.sourceUrl,
                ),
                HoverButton(
                  iconData: Icons.web,
                  url: currentProject.deploymentUrl,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
