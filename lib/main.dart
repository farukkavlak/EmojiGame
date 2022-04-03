import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:emoji_game/data/emojis_literature_data.dart';
import 'package:emoji_game/data/emojis_movies_data.dart';
import 'package:emoji_game/data/emojis_musics_data.dart';
import 'package:emoji_game/data/emojis_series_data.dart';
import 'package:emoji_game/utilities/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'utilities/constants.dart';
import 'package:emoji_game/data/emojis_games_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.initSharedPreferences();
  PreferenceUtils.instance.setLevel(games[0]["name"],true);
  PreferenceUtils.instance.setLevel(movies[0]["name"],true);
  PreferenceUtils.instance.setLevel(musics[0]["name"],true);
  PreferenceUtils.instance.setLevel(literature[0]["name"],true);
  PreferenceUtils.instance.setLevel(series[0]["name"],true);

  runApp(const MyApp());
} 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor: kRed,
        splash: Image.asset(      
          'images/splash.png',
          ),
        splashIconSize: 250,
        nextScreen: const HomeScreen()),
    );
  }
}