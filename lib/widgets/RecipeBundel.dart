import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {required this.id,
      required this.chefs,
      required this.recipes,
      required this.title,
      required this.description,
      required this.imageSrc,
      required this.color});
  }

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Show Apps Monitoring Stats",
    description: "Everything you need to know about your kid's screen time.",
    imageSrc: "assets/images/graph.png",
    color: Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "Start Consultation with Counsellor",
    description: "Consult with experienced child psychologists & counsellors.",
    imageSrc: "assets/images/conversation.png",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Heart Rate Measurement",
    description: "Constantly analyzes blood flow to monitor the mental well-being.",
    imageSrc: "assets/images/heartbeat.png",
    color: Color(0xFF2DBBD8),
  ),
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Interactive Questionnaire",
    description: "Assess the well-being of the child by their answers.",
    imageSrc: "assets/images/questionnaire.png",
    color: Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "To do list",
    description: "Create tasks to reward the child based on tasks completion.",
    imageSrc: "assets/images/to-do-list.png",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Favourable Media Suggestions",
    description: "Suggests age-appropriate content to be viewed by children",
    imageSrc: "assets/images/content.png",
    color: Color(0xFF2DBBD8),
  ),
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Location Sharing",
    description: "Location Sharing to people on all platforms in case of emergencies.",
    imageSrc: "assets/images/share-location.png",
    color: Color(0xFFD82D40),
  ),
];
