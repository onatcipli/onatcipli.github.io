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
    name: 'Project 1',
    deploymentUrl: 'github.com/onatcipli',
    sourceUrl: 'github.com/onatcipli',
    imageUrl: profileImageUrl,
  ),
  ProjectModel(
    name: 'Flutter',
    deploymentUrl: 'github.com/onatcipli',
    sourceUrl: 'github.com/onatcipli',
  ),
];
