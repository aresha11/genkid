import 'package:flutter/material.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/auth/get_user_information_cubit/get_user_information_cubit.dart';
import 'package:genkid/cubit/auth/login_cubit/login_cubit.dart';
import 'package:genkid/cubit/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
import 'package:genkid/cubit/html_cubit/html_cubit.dart';
import 'package:genkid/cubit/posts_cubit/posts_cubit.dart';
import 'package:genkid/cubit/quesitions_cubit/quesitions_cubit.dart';
import 'package:genkid/screens/detailed_roadMap.dart';
import 'package:sizer/sizer.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/utility/router.dart';
import 'cubit/Quizs_cubit/quizs_cubit.dart';
import 'cubit/auth/register_cubit/register_cubit.dart';
// import 'package:native_notify/native_notify.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.init();
   // await Firebase.initializeApp();
  // NativeNotify.initialize(3179, 'gSleddQoPeDdTVUW1581Ml', null, null);
  runApp( const MyApp());
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
              create: (context) => BottomNavigationBarCubit()..currentIndex=0,
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => GetUserInformationCubit()..getUserInformation(),
            ),
            BlocProvider(
              create: (context) => CoursesCubit()..getAllCourses(),
            ),
            BlocProvider(
              create: (context) => QuesitionsCubit(),
            ),
            BlocProvider(
              create: (context) => QuizsCubit(),
            ),
            BlocProvider(
              create: (context) => PostsCubit(),
            ),
            BlocProvider(
              create: (context) => HtmlCubit(),
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

