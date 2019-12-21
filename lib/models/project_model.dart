import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/constants.dart';

class ProjectModel {
  final String name;
  final String imageUrl;

  final String sourceUrl;

  final String deploymentUrl;

  ProjectModel({
    @required this.sourceUrl,
    @required this.deploymentUrl,
    @required this.name,
    @required this.imageUrl,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    name: 'The Ozon',
    deploymentUrl: 'github.com/onatcipli',
    sourceUrl: 'github.com/onatcipli',
    imageUrl: "https://banner2.cleanpng.com/20180523/fuf/kisspng-unity-game-engine-logo-video-game-corelle-brands-5b059883ec9bc6.4197736615270933799692.jpg",
  ),
  ProjectModel(
    name: 'Flutter',
    deploymentUrl: 'github.com/onatcipli',
    sourceUrl: 'github.com/onatcipli',
  ),
];
