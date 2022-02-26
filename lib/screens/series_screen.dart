// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:emoji_game/widgets/emoji_list_card.dart';
import 'package:emoji_game/data/emojis_series_data.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({Key? key}) : super(key: key);
  @override
  _SeriesScreenState createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
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
            emojis: series,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 1,
            emojis: series,
          ),
          EmojiListCard(
            emojis: series,
            cardColor: kEmojiListCardcolor,
            emojiIndex: 2,
          ),
          EmojiListCard(
            emojis: series,
            cardColor: kEmojiListCardcolor,
            emojiIndex: 3,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 4,
            emojis: series,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 5,
            emojis: series,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 6,
            emojis: series,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 7,
            emojis: series,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 8,
            emojis: series,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 9,
            emojis: series,
          ),
        ],
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}