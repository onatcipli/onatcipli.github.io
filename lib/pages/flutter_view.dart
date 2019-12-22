import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/widgets/custom_divider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:onatcipli_github_io/models/project_model.dart';
import 'package:onatcipli_github_io/widgets/project_card.dart';

class FlutterView extends StatelessWidget {
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
              'Projects',
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
        Expanded(
          child: LayoutBuilder(
            builder: (context, constrains) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: projects.map((current) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ProjectCard(
                        height: 200,
                        currentProject: current,
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
