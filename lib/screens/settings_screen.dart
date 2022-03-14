import 'package:flutter/material.dart';
import 'package:emoji_game/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              FontAwesomeIcons.store,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.language,
                    color: kRed,
                  ),
                  title: const Text("Change Language"),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    //open change language
                  },
                ),
              ),
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.solidTrashAlt,
                    color: kRed,
                  ),
                  title: const Text("Reset All Progress"),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    //open change language
                  },
                ),
              ),
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.store,
                    color: kRed,
                  ),
                  title: const Text("Market"),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    //open change language
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
