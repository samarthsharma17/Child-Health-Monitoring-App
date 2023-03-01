import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';

class ActivityCard extends StatelessWidget {

  final String appName;
  final String duration;

  ActivityCard({required this.appName, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 30,
      width: 20,
      child: TextField(
        enabled: false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: appName,
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
        ),
      ),

    );
  }
}
