import 'package:flutter/material.dart';

Color tabBarColor = Color(0xff31313A);
Color backgroundColor = Color(0xff27272D);
Color cardBackgroundColor = Color(0xff31313A);

Color hoverIconColor = Color(0xff78CC6C);
Color iconColor = Color(0xffE0E0E2);

Color titleTextColor = Color(0xffE0E0E2);
Color bodyTextColor = Color(0xff7F7F85);
Color activeTextColor = Color(0xff6DB364);

ThemeData darkTheme = ThemeData(
  hoverColor: hoverIconColor,
  backgroundColor: backgroundColor,
  scaffoldBackgroundColor: backgroundColor,
  cardColor: cardBackgroundColor,
  iconTheme: IconThemeData(
    color: iconColor,
  ),
  textTheme: TextTheme(
    title: TextStyle(
      color: titleTextColor,
      fontSize: 40
    ),
    body1: TextStyle(
        color: bodyTextColor,
    ),
    body2: TextStyle(
      color: activeTextColor,
    )
  ),
);
