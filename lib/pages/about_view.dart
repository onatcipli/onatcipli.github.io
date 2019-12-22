import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/widgets/custom_divider.dart';

import 'package:responsive_builder/responsive_builder.dart';

class AboutView extends StatelessWidget {
  final String _aboutMeString =
      "I'm a software engineer who specializes in Cross-Platform Mobile Application Development. I have experience with cross-platform frameworks such as Ionic, React Native and Flutter. I have been working in a Corporate Company in Turkey on Cross-Platform mobile development for nearly 15 months. The company that I am working for provides business solutions, I have participated in 3 mobile projects which are developed with Ionic and Flutter. In these projects, I experienced to manage the requirements and tasks with Asana, Trello, and Jira. I can easily work with rest APIS and real-time databases. On the other hand, I’m giving public speeches and writing articles about Flutter.";


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'About Me',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
            return CustomDivider(
              sizingInformation: sizingInformation,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,20,0),
                  child: Text(
                    _aboutMeString,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      height: 1.6,
                    ),
                  ),
                ),
              ),
              ResponsiveBuilder(
                builder: (BuildContext context,
                    SizingInformation sizingInformation) {
                  return CustomDivider(
                    sizingInformation: sizingInformation,
                    direction: Axis.vertical,
                  );
                },
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
