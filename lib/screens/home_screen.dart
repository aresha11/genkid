import 'package:custom_sidemenu/custom_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/cubit/auth/get_user_information_cubit/get_user_information_cubit.dart';
import 'package:genkid/cubit/auth/login_cubit/login_cubit.dart';
import 'package:genkid/screens/home_layout_screen.dart';
import 'package:genkid/screens/settings_screens/faq.dart';
import 'package:genkid/screens/settings_screens/html_editor/html_write.dart';
import 'package:genkid/screens/settings_screens/privacy_screen.dart';
import 'package:genkid/screens/settings_screens/rate_screen.dart';
import 'package:genkid/screens/settings_screens/support_us.dart';
import '../config/data/local/shared_preference.dart';
import '../config/utility/app_images.dart';
import '../config/utility/routes.dart';
import '../cubit/posts_cubit/posts_cubit.dart';
import '../widgets/home_container.dart';
import 'package:sizer/sizer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List images=[AppImages.courses,AppImages.practice,AppImages.games,AppImages.road];
    List primaryText=["Courses","Practice","Games","RoadMap"];
    List secondText=["study hard build your self","check your knowledge","15 min for fun","there are many tracks here some of them"];
    List nextScreen=[ AppRoutes.coursesScreenRoute,AppRoutes.quizSplashScreenRoute, AppRoutes.gameScreenRoute, AppRoutes.roadMapRoute,];
    List<CustomMenuItem> menuItemsList=[
      CustomMenuItem(
        callback: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeLayoutScreen()));
        },
        title: 'Home',
        leadingIcon: Icons.home,
        iconSize: 22,
        titleSize: 16,


      ),
      CustomMenuItem(
        callback: () {


          Navigator.push(context, MaterialPageRoute(builder: (context) => const HtmlWriteCode()));
        },
        title: 'Code Editor',
        leadingIcon: Icons.html,
        iconSize: 22,
        titleSize: 12.sp,
      ),      CustomMenuItem(
        callback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RateScreen()));

        },

        title: 'Rate',
        leadingIcon: Icons.star_rate,
        iconSize: 22,
        titleSize: 12.sp,
      ),
      // CustomMenuItem(
      //   callback: () {
      //     // Navigator.push(context, MaterialPageRoute(builder: (context) => const HtmlWriteCode()));
      //   },
      //
      //   title: 'language',
      //   leadingIcon: Icons.language,
      //   iconSize: 22,
      //   titleSize: 11.sp,
      // ),
      CustomMenuItem(
        callback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const FAQ()));
        },

        title: 'FAQs',
        leadingIcon: Icons.question_answer,
        iconSize: 22,
        titleSize: 12.sp,
      ),
      CustomMenuItem(
        callback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Support()));
        },

        title: 'Support Us',
        leadingIcon: Icons.support,
        iconSize: 22,
        titleSize: 12.sp,
      ),
      CustomMenuItem(
        callback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  Privacy()));
        },

        title: 'Privacy',
        leadingIcon: Icons.privacy_tip,
        iconSize: 22,
        titleSize: 12.sp,
      ),
      CustomMenuItem(
        callback: () {
          showAnimatedDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return ClassicGeneralDialogWidget(
                titleText: 'Logout',
                contentText: 'Are You Sure',
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color:
                            Theme.of(context).colorScheme.primary),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.splashScreenRoute, (route) => false);
                        SharedPreference.put(key: "login", value: "false");
                        SharedPreference.clearData();
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color:
                            Theme.of(context).colorScheme.primary),
                      ))
                ],

              );
            },
            animationType: DialogTransitionType.size,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
          );
        },

        title: 'LogOut',
        leadingIcon: Icons.logout,
        iconSize: 22,
        titleSize: 12.sp,
      ),

    ];

    return  BlocConsumer<GetUserInformationCubit, GetUserInformationState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return CustomDrawer(
        menuItemsList: menuItemsList,

        appBarTitle:  
        Text(state is LoadingUserInfoState?
                 "Hi ...... 👋"
                :
        context.read<GetUserInformationCubit>().userInformationModel.firstName.toString()=="null"?
        "Hi ...... 👋"
        :
          'Hi, ${context.read<GetUserInformationCubit>().userInformationModel.firstName} 👋',
          style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400),
        ),
        appBarActions: const [],
        menuIcon: Icon(Icons.menu),
      homeWidget: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(AppImages.backGround, fit: BoxFit.cover),
          ),
          Positioned(
            left: 4.w,
            right: 4.w,
            top: 5.h,

            child: SizedBox(
              height: 90.h,
              width: 100.w,
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,mainAxisSpacing: .1.h,crossAxisSpacing: 5.w,mainAxisExtent: 38.h),
                itemBuilder: (context, index) {
                  return HomeContainer(
                    imageUrl: images[index],
                    primaryTitle: primaryText[index],
                    secondTitle: secondText[index],
                    nextScreen: nextScreen[index],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  },
);
  }
}
