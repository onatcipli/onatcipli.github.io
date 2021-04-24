import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/dark_theme.dart';
import 'package:onatcipli_github_io/models/user.dart';
import 'package:onatcipli_github_io/pages/portfolio.dart';

final currentUserJson = {
  "id": 100,
  "name": "Onat Çipli",
  "title": "Cross-Platform Mobile Developer",
  "profileImageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTGf1xTQLvI3AJz_moWk5Uj8baR9B0ffwSGyuxn9jdgiEf-fEpC",
  "backgroundImageUrl": "https://picsum.photos/id/200/500/500",
  "aboutMe": "I'm a software engineer who specializes in Cross-Platform Mobile Application Development. I have experience with cross-platform frameworks such as Ionic, React Native and Flutter. I have been working in a Corporate Company in Turkey on Cross-Platform mobile development for nearly 15 months. The company that I am working for provides business solutions, I have participated in 3 mobile projects which are developed with Ionic and Flutter. In these projects, I experienced to manage the requirements and tasks with Asana, Trello, and Jira. I can easily work with rest APIS and real-time databases. On the other hand, I’m giving public speeches and writing articles about Flutter.",
  "twitter": "https://twitter.com/CipliOnat",
  "github": "https://github.com/onatcipli",
  "stackoverflow": "https://stackoverflow.com/users/10685785/cipli-onat",
  "linkedin": "https://www.linkedin.com/in/onat-%C3%A7ipli/",
  "medium": "https://medium.com/@ciplionat35"
};

final currentUser = User.fromJson(currentUserJson);

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: currentUser.name,
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Portfolio(),
    );
  }
}
