// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String title;
  String profileImageUrl;
  String backgroundImageUrl;
  String aboutMe;
  String twitter;
  String github;
  String stackoverflow;
  String linkedin;
  String medium;

  User({
    this.id,
    this.name,
    this.title,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.aboutMe,
    this.twitter,
    this.github,
    this.stackoverflow,
    this.linkedin,
    this.medium,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    profileImageUrl: json["profileImageUrl"],
    backgroundImageUrl: json["backgroundImageUrl"],
    aboutMe: json["aboutMe"],
    twitter: json["twitter"],
    github: json["github"],
    stackoverflow: json["stackoverflow"],
    linkedin: json["linkedin"],
    medium: json["medium"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
    "profileImageUrl": profileImageUrl,
    "backgroundImageUrl": backgroundImageUrl,
    "aboutMe": aboutMe,
    "twitter": twitter,
    "github": github,
    "stackoverflow": stackoverflow,
    "linkedin": linkedin,
    "medium": medium,
  };
}
