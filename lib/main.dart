import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:emoji_game/utilities/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'utilities/constants.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.initSharedPreferences();
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