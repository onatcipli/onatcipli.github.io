import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/dark_theme.dart';
import 'package:onatcipli_github_io/pages/portfolio.dart';

void main() => runApp(MyPortfolioApp());

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onat Cipli',
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Portfolio(),
    );
  }
}
