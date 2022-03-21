// ignore_for_file: file_names
import 'package:emoji_game/widgets/emoji_list_card.dart';
import 'package:flutter/material.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:emoji_game/data/emojis_literature_data.dart';

class LitScreen extends StatefulWidget {
  const LitScreen({Key? key}) : super(key: key);
  @override
  _LitScreenState createState() => _LitScreenState();
}

class _LitScreenState extends State<LitScreen> {
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
        actions: [
          IconButton(
            padding: const EdgeInsets.all(20.0),
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView(
        children: [
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 0,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 1,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 2,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 3,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 4,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 5,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 6,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 7,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 8,
            emojis: literature,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 9,
            emojis: literature,
          ),
        ],
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
