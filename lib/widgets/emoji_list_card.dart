// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:emoji_game/screens/game_screen.dart';
import 'package:emoji_game/utilities/pref_util.dart';

class EmojiListCard extends StatefulWidget {
  final List emojis;
  final Color cardColor;
  final int emojiIndex;
  final Function refresh;
  const EmojiListCard({
    required this.emojis,
    required this.cardColor,
    required this.emojiIndex,
    required this.refresh,
  });

  @override
  State<EmojiListCard> createState() => _EmojiListCardState();
}

class _EmojiListCardState extends State<EmojiListCard> {
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
          ).then((_) => setState(() { 
            widget.refresh();
          }));
        },
        enabled: PreferenceUtils.instance.getLevel(widget.emojis[widget.emojiIndex]['name'].toString())==true?true:false,
        color: widget.cardColor,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: List.generate(
              widget.emojis[widget.emojiIndex]['emojis'].length, (index) {
                return Text(
                  widget.emojis[widget.emojiIndex]['emojis'][index]['emoji'],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                );
              },
              ),
          ),
        ),
      ),
    );
  }
}
