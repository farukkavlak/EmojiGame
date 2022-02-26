// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:emoji_game/screens/game_screen.dart';

class EmojiListCard extends StatelessWidget {
  final List emojis;
  final Color cardColor;
  final int emojiIndex;
  const EmojiListCard({
    required this.emojis,
    required this.cardColor,
    required this.emojiIndex,
  });

  @override
  Widget build(BuildContext context) {
    double widthMain = MediaQuery.of(context).size.width;
    return Center(
      child: AnimatedButton(
        width: widthMain / 4,
        height: widthMain / 4,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameScreen(
                  indexNumber: emojiIndex, categoryName: emojis,
                )),
          );
        },
        color: cardColor,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(itemCount:emojis[emojiIndex]['emojis'].length,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2
          ), itemBuilder: (BuildContext context, int index){
            return Text(
              emojis[emojiIndex]['emojis'][index]['emoji'],
              style: const TextStyle(
                fontSize: 25,
              ),
            );
          }),
        ),
      ),
    );
  }
}
