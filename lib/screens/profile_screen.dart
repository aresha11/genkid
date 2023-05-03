import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../config/utility/app_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.jpeg'), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                color: Colors.transparent,
                height: 28.h,
                width: 100.w,
              )),
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
              left: 38.w,
              child: Text("UserName",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ))),
          Positioned(
              top: 62.h,
              left: 48.w,
              child: Text("Bio",
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                  ))),
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
  }
}
