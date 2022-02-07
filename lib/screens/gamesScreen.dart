import 'package:emoji_game/data/emojisGames.dart';
import 'package:emoji_game/widgets/emojiListCard.dart';
import 'package:flutter/material.dart';
import 'package:emoji_game/screens/gameScreen.dart';
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
          padding: EdgeInsets.all(20.0),
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.all(20.0),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: GridView(
          children: [
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 0, emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 1,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 2,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 3,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 4,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 5,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 6,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 7,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 8,emojis: games,
            ),
            EmojiListCard(
              cardColor: kEmojiListCardcolor,
              emojiIndex: 9,emojis: games,
            ),
          ],
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
      ),
    );
  }
}
