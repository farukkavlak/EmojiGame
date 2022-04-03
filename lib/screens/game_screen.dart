// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors
import 'dart:math';

import 'package:emoji_game/utilities/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:animated_button/animated_button.dart';
import 'package:emoji_game/widgets/custom_alert.dart';

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
  late String levelName;
  late String levelNameNext;
  List<Flexible> emojiList = [];
  late String word;
  late String hiddenWord;
  List<bool> buttonStatus = [];
  bool finishedGame = false;
  bool resetGame = false;
  List<String> hintLetters = [];

  Widget createButton(index) {
    return AnimatedButton(
      width: 50,
      height: 50,
      child: Text(
        kAlphabet[index].toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
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
    levelName = widget.categoryName[widget.indexNumber]['name'].toString();
    levelNameNext = widget.categoryName[widget.indexNumber+1]['name'].toString();
    if (emojiList.length ==
        widget.categoryName[widget.indexNumber]['emojis'].length) {
    } else {
      for (int i = 0;
          i < widget.categoryName[widget.indexNumber]['emojis'].length;
          i++) {
        emojiList.add(Flexible(
          child: Container(
            width: 60,
            height: 70,
            decoration: const BoxDecoration(
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
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Center(
                child: Text(widget.categoryName[widget.indexNumber]['emojis'][i]
                    ['emoji']),
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

  @override
  void initState() {
    //_checkFirstTime();
    super.initState();
    initWords();
    removeEmojiList();
    initEmojiList();
  }

  void initWords() {
    hintLetters = [];
    finishedGame = false;
    resetGame = false;
    word = widget.categoryName[widget.indexNumber]['name'];
    for (int i = 0; i < word.length; i++) {
      if (word[i] != " ") {
        hintLetters.add(word[i]);
      }
    }

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
        }
      }
      if (!check&&PreferenceUtils.instance.getHP()!=0) {
        PreferenceUtils.instance.setHP(PreferenceUtils.instance.getHP()-1);
      }
      if (PreferenceUtils.instance.getHP() == 0) {
        //Error alert
        finishedGame = true;
        showDialog(
              barrierColor: Colors.black26,
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: "Game Over",
                  description: "",
                  type : "Error",
                  text1: "Try Again▶️",
                  text2: "Cancel",
                  onPressed :(){},
                );
        });
      }
      for (int i = 0; i < word.length; i++) {
        if (word[i] == kAlphabet[index]) {
          hiddenWord = hiddenWord.replaceFirst(RegExp('_'), word[i], i);
        }
      }
      buttonStatus[index] = false;
      if (hiddenWord == word) {
        PreferenceUtils.instance.setHP(PreferenceUtils.instance.getHP()+1);
        
        finishedGame = true;
        showDialog(
              barrierColor: Colors.black26,
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: word,
                  description: widget.categoryName[widget.indexNumber]['info'].toString(), 
                  type: 'Success',
                  text1: 'Continue',
                  text2: 'Cancel',
                  onPressed: (){
                    setState(() {
                      PreferenceUtils.instance.setLevel(levelName,false);
                      PreferenceUtils.instance.setLevel(levelNameNext,true);
                      PreferenceUtils.instance.setHint(PreferenceUtils.instance.getHint()+1);
                      Navigator.pop(context);
                      widget.indexNumber++;
                      initWords();
                      removeEmojiList();
                      initEmojiList();
                    });
                  },
                );
        });
      }
      

      
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
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "❤️",
            ),
            Text(PreferenceUtils.instance.getHP().toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                      )),
            TextButton(
              child: const Text("🔑"),
              onPressed: () {
                setState(() {
                  if (PreferenceUtils.instance.getHint() == 0) {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return  CustomAlertDialog(
                            title: 'Gain a hint',
                            description: '', 
                            type: 'HintError',
                            text1: '▶️',
                            text2: 'Cancel',
                            onPressed: (){},
                );
        });
                  } else {
                    int hintNumber = Random().nextInt(hintLetters.length);
                    wordPress(kAlphabet.indexOf(hintLetters[hintNumber]));
                    hintLetters.removeWhere(
                        (element) => element == hintLetters[hintNumber]);
                  PreferenceUtils.instance.setHint(PreferenceUtils.instance.getHint()-1);
                  }
                });
              },
            ),
            Text(PreferenceUtils.instance.getHint().toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                      )),
          ],
        ),
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                alignment: Alignment.center,
                child: createRow(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35.0),
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
                padding: const EdgeInsets.fromLTRB(10.0, 0, 8.0, 0),
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
                      const TableCell(
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
                      const TableCell(
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
