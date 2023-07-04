import 'package:device_apps/device_apps.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
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
      backgroundColor: Color(0xff266E73),
      body: ListView(

        children: [
          SizedBox(height: 20,),

          InkWell(
            onTap: () async {
              try {
                ///checks if the app is installed on your mobile device
                bool isInstalled = await DeviceApps.isAppInstalled('si.modula.android.instantheartrate');
                if (isInstalled) {
                  DeviceApps.openApp("com.DilmerGamesLLC.ARRace");
                } else {
                  ///if the app is not installed it lunches google play store so you can install it from there
                  launch("market://details?id=" +"com.DilmerGamesLLC.ARRace");
                }
              } catch (e) {
                print(e);
              }
              // var openAppResult = await LaunchApp.openApp(
              //   androidPackageName: 'com.DilmerGamesLLC.ARRace',
              // );
            },
            child:
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/ar_game.jpg'),fit: BoxFit.fill
                    )
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child:  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                    child: Center(child: Text('ar game',style: TextStyle(color: Colors.white),)),
                  ),
                ),

          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () async {
              try {
                ///checks if the app is installed on your mobile device
                bool isInstalled = await DeviceApps.isAppInstalled('si.modula.android.instantheartrate');
                if (isInstalled) {
                  DeviceApps.openApp("com.DefaultCompany.Puzzle_game");
                } else {
                  ///if the app is not installed it lunches google play store so you can install it from there
                  launch("market://details?id=" +"com.DefaultCompany.Puzzle_game");
                }
              } catch (e) {
                print(e);
              }
              // var openAppResult = await LaunchApp.openApp(
              //   androidPackageName: 'com.DefaultCompany.Puzzle_game',
              // );
            },
            child:
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/puzzle.webp'),fit: BoxFit.fill
                    )
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                    child: Center(child: Text('puzzle game',style: TextStyle(color: Colors.white),)),
                  ),
                ),

          ),
          SizedBox(height: 20,),

          InkWell(
            onTap: () async {
              try {
                ///checks if the app is installed on your mobile device
                bool isInstalled = await DeviceApps.isAppInstalled('si.modula.android.instantheartrate');
                if (isInstalled) {
                  DeviceApps.openApp("com.DefaultCompany.Puzzle_game");
                } else {
                  ///if the app is not installed it lunches google play store so you can install it from there
                  launch("market://details?id=" +"com.DefaultCompany.Memory_game");
                }
              } catch (e) {
                print(e);
              }
              // var openAppResult = await LaunchApp.openApp(
              //   androidPackageName: 'com.DefaultCompany.Memory_game',
              // );
            },
            child:

                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/memory2.jpg'),fit: BoxFit.fill
                    )
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                    child: Center(child: Text('memory game',style: TextStyle(color: Colors.white),)),
                  ),
                ),



          ),

        ],
      ),
    );
  }
}
