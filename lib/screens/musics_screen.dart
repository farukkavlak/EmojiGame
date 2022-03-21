// ignore_for_file: file_names
import 'package:emoji_game/widgets/emoji_list_card.dart';
import 'package:flutter/material.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:emoji_game/data/emojis_musics_data.dart';

class MusicsScreen extends StatefulWidget {
  const MusicsScreen({Key? key}) : super(key: key);
  @override
  _MusicsScreenState createState() => _MusicsScreenState();
}

class _MusicsScreenState extends State<MusicsScreen> {
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
            emojiIndex: 0,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 1,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 2,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 3,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 4,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 5,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 6,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 7,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 8,
            emojis: musics,
          ),
          EmojiListCard(
            cardColor: kEmojiListCardcolor,
            emojiIndex: 9,
            emojis: musics,
          ),
        ],
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
