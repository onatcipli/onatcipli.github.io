import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/pages/desktop_view.dart';
import 'package:onatcipli_github_io/pages/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          if (sizingInformation.isDesktop || sizingInformation.isTablet) {
            return DesktopView();
          } else {
            return MobileView();
          }
        },
      ),
    );
  }
}
