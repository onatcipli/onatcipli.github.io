import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/constants.dart';
import 'package:onatcipli_github_io/widgets/custom_divider.dart';

import 'package:responsive_builder/responsive_builder.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
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
              builder:
                  (BuildContext context, SizingInformation sizingInformation) {
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
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        aboutMeString,
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
        )
      ],
    );
  }
}
