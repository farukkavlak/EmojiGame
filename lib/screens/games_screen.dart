// ignore_for_file: file_names
import 'package:emoji_game/data/emojis_games_data.dart';
import 'package:emoji_game/widgets/emoji_list_card.dart';
import 'package:flutter/material.dart';
import 'package:emoji_game/utilities/constants.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);
  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightYellow,
      appBar: AppBar(
        backgroundColor: kLightYellow,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(20.0),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView(
        children: [
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 0, emojis: games, 
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 1,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 2,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 3,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 4,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 5,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 6,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 7,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 8,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 9,emojis: games,
            refresh: (){
              setState(() {
                
              });
            },
          ),
        ],
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
