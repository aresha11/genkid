import 'package:flutter/material.dart';
import '../config/data/local/shared_preference.dart';
import '../config/utility/app_images.dart';
import '../config/utility/routes.dart';
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

    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(AppImages.backGround, fit: BoxFit.cover),
        ),
        // Positioned(
        //   top: 5.h,
        //   child: Row(
        //     children: [
        //       IconButton(onPressed: () {
        //         SharedPreference.put(key: "login", value: "false");
        //         Navigator.pushNamed(context, AppRoutes.splashScreenRoute);
        //       },
        //           icon: const Icon(Icons.arrow_back_ios_outlined),color: Colors.black),
        //       const Text("LogOut",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),
        //     ],
        //   ),
        // ),
        Positioned(
          left: 4.w,
          right: 4.w,
          top: 10.h,

          child: SizedBox(
            height: 90.h,
            width: 100.w,
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 13,mainAxisExtent: 260),
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
    );
  }
}
