import 'package:flutter/material.dart';
import 'package:emoji_game/screens/moviesScreen.dart';
import 'package:emoji_game/screens/seriesScreen.dart';
import 'package:emoji_game/screens/gamesScreen.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:emoji_game/widgets/categoryCard.dart';

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
        leading: IconButton(
          padding: EdgeInsets.all(20.0),
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.all(20.0),
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CategoryCard(
                      cardColor: kRed,
                      title: 'Movies',
                      imageDirectory: 'images/movies.png',
                      child: MoviesScreen(),
                    ),
                    CategoryCard(
                      cardColor: kRed,
                      title: 'Series',
                      child: SeriesScreen(),
                      imageDirectory: 'images/series.png',
                    ),
                    CategoryCard(
                      cardColor: kRed,
                      title: 'Games',
                      child: GamesScreen(),
                      imageDirectory: 'images/games.png',
                    ),
                    CategoryCard(
                      cardColor: kRed,
                      title: 'Literature',
                      child: GamesScreen(),
                      imageDirectory: 'images/literature.png',
                    ),
                    CategoryCard(
                      cardColor: kRed,
                      title: 'Musics',
                      child: GamesScreen(),
                      imageDirectory: 'images/musics.png',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 122,
                    height: 122,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/avatar.png"),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  Container(
                    width: 225,
                    height: 97,
                    child: Center(
                      child: Text(
                        "Let's play a game,Choose a category to start playing!",
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
                    decoration: BoxDecoration(
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
