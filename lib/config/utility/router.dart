import 'package:flutter/material.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/screens/course_content.dart';
import 'package:genkid/screens/courses.dart';
import 'package:genkid/screens/forget_password.dart';
import 'package:genkid/screens/home_layout_screen.dart';
import 'package:genkid/screens/login_screen.dart';
import 'package:genkid/screens/profile_screen.dart';
import 'package:genkid/screens/quiz_screens/question_screen.dart';
import 'package:genkid/screens/quiz_screens/quiz_splash_screen.dart';
import 'package:genkid/screens/register_screen.dart';
import 'package:genkid/screens/road_map.dart';
import 'package:genkid/screens/setting_screen.dart';
import 'package:genkid/screens/splashScreen.dart';
import 'package:genkid/screens/video_content.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.registerScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterScreen(), settings: routeSettings);
    case AppRoutes.homeScreenLayoutRoute:
      return MaterialPageRoute(
          builder: (context) =>const HomeScreenLayout(), settings: routeSettings);

    case AppRoutes.loginScreenRoute:
      return MaterialPageRoute(
          builder: (context) =>const LoginScreen(), settings: routeSettings);
      case AppRoutes.questionScreenRoute:
      return MaterialPageRoute(
          builder: (context) =>const QuestionScreen(), settings: routeSettings);
      case AppRoutes.coursesScreenRoute:
      return MaterialPageRoute(
          builder: (context) =>const Courses(), settings: routeSettings);
      case AppRoutes.courseContentRoute:
      return MaterialPageRoute(
          builder: (context) => CourseContent(), settings: routeSettings);
      case AppRoutes.quizSplashScreen:
      return MaterialPageRoute(
          builder: (context) => const QuizSplashScreen(), settings: routeSettings);
      case AppRoutes.roadMap:
      return MaterialPageRoute(
          builder: (context) => const RoadMap(), settings: routeSettings);
      case AppRoutes.forgetPassword:
      return MaterialPageRoute(
          builder: (context) => const ForgetPassword(), settings: routeSettings);
      case AppRoutes.videoContent:
      return MaterialPageRoute(
          builder: (context) =>  VideoContent(), settings: routeSettings);
      case AppRoutes.profileScreen:
      return MaterialPageRoute(
          builder: (context) => const ProfileScreen(), settings: routeSettings);
      case AppRoutes.settingScreen:
      return MaterialPageRoute(
          builder: (context) => const SettingScreen(), settings: routeSettings);
    case AppRoutes.splashScreenRoute:
    default:
      return MaterialPageRoute(
          builder: (context) =>  SplashScreen(), settings: routeSettings);




  }
}