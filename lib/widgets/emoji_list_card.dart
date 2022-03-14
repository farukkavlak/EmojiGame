// ignore_for_file: use_key_in_widget_constructors

import 'package:emoji_game/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:emoji_game/screens/game_screen.dart';
import 'package:emoji_game/utilities/pref_util.dart';

class EmojiListCard extends StatefulWidget {
  final List emojis;
  final Color cardColor;
  final int emojiIndex;
  const EmojiListCard({
    required this.emojis,
    required this.cardColor,
    required this.emojiIndex,
  });

  @override
  State<EmojiListCard> createState() => _EmojiListCardState();
}

class _EmojiListCardState extends State<EmojiListCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                  indexNumber: widget.emojiIndex, categoryName: widget.emojis,
                )),
          ).then((_) => setState(() {}));
        },
        color: PreferenceUtils.instance.getLevel(widget.emojis[widget.emojiIndex]['name'].toString()+widget.emojiIndex.toString())==true ? kEmojiListCardColorCompleted: widget.cardColor,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(itemCount:widget.emojis[widget.emojiIndex]['emojis'].length,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2
          ), itemBuilder: (BuildContext context, int index){
            return Text(
              widget.emojis[widget.emojiIndex]['emojis'][index]['emoji'],
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
