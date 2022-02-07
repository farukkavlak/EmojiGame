import 'package:emoji_game/data/emojisSeries.dart';
import 'package:flutter/material.dart';
import 'package:emoji_game/screens/moviesScreen.dart';
import 'package:emoji_game/screens/seriesScreen.dart';
import 'package:emoji_game/screens/homeScreen.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:emoji_game/data/emojisMovies.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:animated_button/animated_button.dart';

class GameScreen extends StatefulWidget {
  List categoryName;
  GameScreen({
    required this.categoryName,
    required this.indexNumber,
  });
  int indexNumber;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int hangState = 0;
  List<Flexible> emojiList = [];
  late String word;
  late String hiddenWord;
  List<bool> buttonStatus = [];
  bool finishedGame = false;
  bool resetGame = false;
  Widget createButton(index) {
    return AnimatedButton(
      width: 50,
      height: 50,
      child: Text(
        kAlphabet[index].toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13, //customize size here
          fontWeight: FontWeight.w600,
          color: Colors.white,
          // AND others usual text style properties (fontFamily, fontWeight, ...)
        ),
      ),
      enabled: buttonStatus[index] ? true : false,
      color: kButtonColor,
      onPressed: () => wordPress(index),
    );
  }

  List<Flexible> createEmoji() {

    if (emojiList.length == widget.categoryName[widget.indexNumber]['emojis'].length) {
    } else {
      for (int i = 0; i < widget.categoryName[widget.indexNumber]['emojis'].length; i++) {
        emojiList.add(Flexible(
          child: Container(
            width: 60,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Center(
                child: Text(widget.categoryName[widget.indexNumber]['emojis'][i]['emoji']),
              ),
            ),
          ),
        ));
      }
    }
    return emojiList;
  }

  Widget createRow() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: emojiList,
      ),
    );
  }

  void initState() {
    super.initState();
    initWords();
    removeEmojiList();
    initEmojiList();
  }

  void initWords() {
    finishedGame = false;
    resetGame = false;
    word = widget.categoryName[widget.indexNumber]['name'];
    buttonStatus = List.generate(26, (index) {
      return true;
    });
    hiddenWord = '';
    for (int i = 0; i < word.length; i++) {
      if (word[i] == ' ') {
        hiddenWord += ' ';
      } else {
        hiddenWord += '_';
      }
    }
  }

  void initEmojiList() {
    setState(() {
      emojiList = createEmoji();
    });
  }

  void removeEmojiList() {
    setState(() {
      emojiList = [];
    });
  }

  void wordPress(int index) {
    if (finishedGame) {
      setState(() {
        resetGame = true;
      });
      return;
    }
    bool check = false;
    setState(() {
      for (int i = 0; i < word.length; i++) {
        if (word[i] == kAlphabet[index]) {
          check = true;
          hiddenWord = hiddenWord.replaceFirst(RegExp('_'), word[i], i);
        }
      }
      if (!check) {
        hangState += 1;
      }
      buttonStatus[index] = false;
      if (hangState == 6) {
        finishedGame = true;
        Alert(
          context: context,
          style: kFailedAlertStyle,
          type: AlertType.error,
          title: word,
//            desc: "You Lost!",
          buttons: [
            DialogButton(
              radius: BorderRadius.circular(10),
              child: Icon(
                Icons.arrow_forward,
                size: 30.0,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  initWords();
                });
              },
              width: 127,
              color: kDialogButtonColor,
              height: 52,
            ),
          ],
        ).show();
      }
      if (hiddenWord == word) {
        finishedGame = true;
        Alert(
          context: context,
          style: kSuccessAlertStyle,
          type: AlertType.success,
          title: word,
//          desc: "You guessed it right!",
          buttons: [
            DialogButton(
              radius: BorderRadius.circular(10),
              child: Icon(
                Icons.arrow_forward,
                size: 30.0,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  widget.indexNumber++;
                  initWords();
                  removeEmojiList();
                  initEmojiList();
                });
              },
              width: 127,
              color: kDialogButtonColor,
              height: 52,
            )
          ],
        ).show();
      }
    });
  }

  void newGame() {
    setState(() {
      finishedGame = false;
      resetGame = false;
      initWords();
      initEmojiList();
    });
  }

  void returnHomePage() {
    Navigator.pop(context);
  }

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 35.0),
                alignment: Alignment.center,
                child: createRow(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 35.0),
                  alignment: Alignment.center,
                  child: Text(
                    hiddenWord,
                    style: kWordTextStyle30,
                    textAlign: TextAlign.center,
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 8.0, 0),
                child: Table(
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: createButton(0),
                      ),
                      TableCell(
                        child: createButton(1),
                      ),
                      TableCell(
                        child: createButton(2),
                      ),
                      TableCell(
                        child: createButton(3),
                      ),
                      TableCell(
                        child: createButton(4),
                      ),
                      TableCell(
                        child: createButton(5),
                      ),
                      TableCell(
                        child: createButton(6),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(7),
                      ),
                      TableCell(
                        child: createButton(8),
                      ),
                      TableCell(
                        child: createButton(9),
                      ),
                      TableCell(
                        child: createButton(10),
                      ),
                      TableCell(
                        child: createButton(11),
                      ),
                      TableCell(
                        child: createButton(12),
                      ),
                      TableCell(
                        child: createButton(13),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(14),
                      ),
                      TableCell(
                        child: createButton(15),
                      ),
                      TableCell(
                        child: createButton(16),
                      ),
                      TableCell(
                        child: createButton(17),
                      ),
                      TableCell(
                        child: createButton(18),
                      ),
                      TableCell(
                        child: createButton(19),
                      ),
                      TableCell(
                        child: createButton(20),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: Text(''),
                      ),
                      TableCell(
                        child: createButton(21),
                      ),
                      TableCell(
                        child: createButton(22),
                      ),
                      TableCell(
                        child: createButton(23),
                      ),
                      TableCell(
                        child: createButton(24),
                      ),
                      TableCell(
                        child: createButton(25),
                      ),
                      TableCell(
                        child: Text(''),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
