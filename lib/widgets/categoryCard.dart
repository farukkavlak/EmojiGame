import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:emoji_game/screens/gameScreen.dart';
import 'package:emoji_game/utilities/constants.dart';

class CategoryCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final Widget child;
  final String imageDirectory;
  CategoryCard({
    required this.cardColor,
    required this.title,
    required this.child,
    required this.imageDirectory,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: AnimatedButton(
        width: MediaQuery.of(context).size.width - 30,
        height: (MediaQuery.of(context).size.height / (8.3)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => this.child),
          );
        },
        color: this.cardColor,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              child: Image.asset(
                this.imageDirectory,
              ),
            ),
            SizedBox(
              width: 35.0,
            ),
            Text(
              this.title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25, //customize size here
                fontWeight: FontWeight.w600, //customize depth here
                color: Colors.white, //customize color here
              ),
            ),
          ],
        ),
      ),
    );
  }
}
