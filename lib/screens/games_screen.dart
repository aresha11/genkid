import 'package:device_apps/device_apps.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:genkid/widgets/main_button.dart';

import '../config/utility/app_images.dart';
import '../widgets/custum_appbar.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustumAppBar("Games")),
      backgroundColor: Color(0xff266E73),
      body: Stack(
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.backGround,
              fit: BoxFit.cover,
            ),
          ),
          ListView(

            children: [
              SizedBox(height: 20,),

              InkWell(
                onTap: () async {
                  try {
                    ///checks if the app is installed on your mobile device
                    bool isInstalled = await DeviceApps.isAppInstalled('com.DilmerGamesLLC.ARRace');
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
                      decoration: const BoxDecoration(
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
                            color: Color(0xff1D5C92)
                        ),
                        child: Center(child: Text('Ar Race',style: TextStyle(color: Colors.white),)),
                      ),
                    ),

              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  try {
                    ///checks if the app is installed on your mobile device
                    bool isInstalled = await DeviceApps.isAppInstalled('com.DefaultCompany.Puzzle_game');
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/puzzle.webp'),fit: BoxFit.fill
                        )
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.08,
                        decoration: const BoxDecoration(
                            color: Color(0xff1D5C92)
                        ),
                        child: Center(child: Text('Puzzle',style: TextStyle(color: Colors.white),)),
                      ),
                    ),

              ),
              SizedBox(height: 20,),

              InkWell(
                onTap: () async {
                  try {
                    ///checks if the app is installed on your mobile device
                    bool isInstalled = await DeviceApps.isAppInstalled('com.DefaultCompany.Memory_game');
                    if (isInstalled) {
                      DeviceApps.openApp("com.DefaultCompany.Memory_game");
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/memory2.jpg'),fit: BoxFit.fill
                        )
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.08,
                        decoration: const BoxDecoration(
                            color: Color(0xff1D5C92)
                        ),
                        child: Center(child: Text('Memory',style: TextStyle(color: Colors.white),)),
                      ),
                    ),
              ),
              InkWell(
                onTap: () async {
                  try {
                    ///checks if the app is installed on your mobile device
                    bool isInstalled = await DeviceApps.isAppInstalled('com.DefaultCompany.Memory_game');
                    if (isInstalled) {
                      DeviceApps.openApp("com.DefaultCompany.Memory_game");
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/course0.png'),fit: BoxFit.fill
                        )
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.08,
                        decoration: const BoxDecoration(
                            color: Color(0xff1D5C92)
                        ),
                        child: Center(child: Text('Logo Recognition',style: TextStyle(color: Colors.white),)),
                      ),
                    ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
