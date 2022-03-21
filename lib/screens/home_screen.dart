// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:emoji_game/screens/movies_screen.dart';
import 'package:emoji_game/screens/series_screen.dart';
import 'package:emoji_game/screens/games_screen.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:emoji_game/widgets/category_card.dart';
import 'package:emoji_game/screens/literature_screen.dart';
import 'package:emoji_game/screens/musics_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double heightMain = MediaQuery.of(context).size.height;
    double widthMain = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightYellow,
      appBar: AppBar(
        backgroundColor: kLightYellow,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const CategoryCard(
                      cardColor: kRed,
                      title: 'Movies',
                      imageDirectory: 'images/movies.png',
                      child: MoviesScreen(),
                    ),
                    const CategoryCard(
                      cardColor: kRed,
                      title: 'Series',
                      child: SeriesScreen(),
                      imageDirectory: 'images/series.png',
                    ),
                    const CategoryCard(
                      cardColor: kRed,
                      title: 'Games',
                      child: GamesScreen(),
                      imageDirectory: 'images/games.png',
                    ),
                    const CategoryCard(
                      cardColor: kRed,
                      title: 'Literature',
                      child: LitScreen(),
                      imageDirectory: 'images/literature.png',
                    ),
                    const CategoryCard(
                      cardColor: kRed,
                      title: 'Musics',
                      child: MusicsScreen(),
                      imageDirectory: 'images/musics.png',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: widthMain * 0.3,
                    height: widthMain * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/avatar.png"),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  Container(
                    width: widthMain * 0.6,
                    height: heightMain * 0.13,
                    child: const Center(
                      child: Text(
                        "Let's play a game,\nChoose a category to start playing!",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15, //customize size here
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          // AND others usual text style properties (fontFamily, fontWeight, ...)
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(25),
                      ),
                      color: Color.fromRGBO(228, 100, 113, 1),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
