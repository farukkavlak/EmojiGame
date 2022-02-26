// ignore_for_file: file_names, sized_box_for_whitespace, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

class CategoryCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final Widget child;
  final String imageDirectory;
  const CategoryCard({
    required this.cardColor,
    required this.title,
    required this.child,
    required this.imageDirectory,
  });
  @override
  Widget build(BuildContext context) {
    double widthMain = MediaQuery.of(context).size.width;
    double heightMain = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: AnimatedButton(
        width: widthMain*0.92,
        height: (heightMain / (8.3)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => child),
          );
        },
        color: cardColor,
        child: Row(
          children: [
            SizedBox(
              width: widthMain*0.1,
            ),
            Container(
              width: widthMain*0.27,
              child: Image.asset(
                imageDirectory,
              ),
            ),
            SizedBox(
              width: widthMain*0.1,
            ),
            Text(
              title,
              style: const TextStyle(
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
