import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:emoji_game/screens/gameScreen.dart';
import 'package:emoji_game/data/emojisMovies.dart';
import 'package:emoji_game/data/emojisGames.dart';
import 'package:emoji_game/data/emojisLiterature.dart';
import 'package:emoji_game/data/emojisMusics.dart';
import 'package:emoji_game/data/emojisSeries.dart';

class EmojiListCard extends StatelessWidget {
  final List emojis;
  final Color cardColor;
  final int emojiIndex;
  EmojiListCard({
    required this.emojis,
    required this.cardColor,
    required this.emojiIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedButton(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.width / 4,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameScreen(
                  indexNumber: this.emojiIndex, categoryName: emojis,
                )),
          );
        },
        color: this.cardColor,
        child: Container(
          padding: EdgeInsets.all(15),
          child: GridView.builder(itemCount:emojis[emojiIndex]['emojis'].length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2
          ), itemBuilder: (BuildContext context, int index){
            return Text(
              emojis[emojiIndex]['emojis'][index]['emoji'],
              style: TextStyle(
                fontSize: 25,
              ),
            );
          }),
        ),
      ),
    );
  }
}
