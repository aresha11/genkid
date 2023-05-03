import 'package:flutter/material.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
import 'package:genkid/cubit/register_cubit/register_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:genkid/provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/utility/router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.init();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<Data>(
      create: (BuildContext context)=>Data(),
      child:  const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Sizer(
      builder: (context, orientation, deviceType){
        return   MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BottomNavigationBarCubit(),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => CoursesCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerate,

            initialRoute: AppRoutes.splashScreenRoute,
          ),
        );

      },
    );
  }
}

