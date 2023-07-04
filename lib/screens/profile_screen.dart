import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/auth/get_user_information_cubit/get_user_information_cubit.dart';
import 'package:sizer/sizer.dart';
import '../config/utility/app_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserInformationCubit, GetUserInformationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.jpeg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              // Positioned(
              //     top: 3.h,
              //     right: 0,
              //     child: IconButton(
              //       icon: Icon(Icons.exit_to_app),
              //       onPressed: () {
              //         SharedPreference.put(key: "login", value: "false");
              //         Navigator.pushNamed(context, AppRoutes.splashScreenRoute);
              //       },
              //     )),
              Positioned(
                top: 4.h,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppImages.registerPicture,
                  fit: BoxFit.cover,
                  height: 45.h,
                ),
              ),
              Positioned(
                top: 40.h,
                right: 3.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 7.w,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                      )),
                ),
              ),
              Positioned(
                  top: 40.h,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 13.w,
                    child: CircleAvatar(
                      radius: 12.w,
                      backgroundImage: AssetImage(AppImages.loginPicture),
                    ),
                  )),
              Positioned(
                top: 49.h,
                right: 40.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 5.w,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                      )),
                ),
              ),
              Positioned(
                  top: 57.h,
                  left: 0,
                  right: 0,
                  child: Text(
                    context
                        .read<GetUserInformationCubit>()
                        .userInformationModel
                        .firstName
                        .toString(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Positioned(
                  top: 62.h,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Bio",
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Positioned(
                  top: 71.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    width: 90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.w),
                        gradient: const LinearGradient(colors: [
                          Color(0xffFFFFFF),
                          Color(0xffF2F6FF),
                          Color(0xffAEBEDF),
                        ])),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.home_filled),
                              Text("Live in shibeen",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time_sharp),
                              Text("Joined in Jan 2015",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
