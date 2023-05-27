import 'package:flutter/material.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/auth/get_user_information_cubit/get_user_information_cubit.dart';
import 'package:genkid/cubit/auth/login_cubit/login_cubit.dart';
import 'package:genkid/cubit/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
import 'package:genkid/cubit/quesitions_cubit/quesitions_cubit.dart';
import 'package:genkid/cubit/video_cubit/video_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/utility/router.dart';
import 'cubit/auth/register_cubit/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => GetUserInformationCubit(),
            ),
            BlocProvider(
              create: (context) => CoursesCubit()..getAllCourses(),
            ),
            BlocProvider(
              create: (context) => VideoCubit(),
            ),
            BlocProvider(
              create: (context) => QuesitionsCubit(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerate,

            initialRoute: AppRoutes.splashScreenRoute,
          ),
        );

      },
    );
  }
}

