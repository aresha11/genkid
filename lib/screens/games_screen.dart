import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:genkid/widgets/main_button.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainButton(
          title: "Game",
          color: Colors.blue,
          onPressed: () async {
            var openAppResult = await LaunchApp.openApp(
              androidPackageName: 'com.DilmerGamesLLC.ARRace',
            );
          },
        ),
      ),
    );
  }
}
