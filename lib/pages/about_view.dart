import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/widgets/custom_divider.dart';

class AboutView extends StatelessWidget {
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
        CustomDivider(),
        Text('something'),
        Text('something'),
      ],
    );
  }
}
