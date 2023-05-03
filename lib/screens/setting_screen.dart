import 'package:flutter/material.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:sizer/sizer.dart';

import '../widgets/primary_text.dart';
import '../widgets/setting_row.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.backGround,),fit: BoxFit.cover)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 7.h,
              color: const Color(0xffE5E7EB),
              child: PrimaryText(title:"General", size: 20,),
            ),
            SizedBox(height: 3.h,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ProfileRow(prefixIcon: Icons.person,
                      title: "EditProfile",
                      onPress: () {
                      //   Navigator.pushNamed(
                      //       context, AppRoutes.editProfileRoute);
                       }
                      ),
                  SizedBox(height: 2.h,),
                  const Divider(
                    thickness: 2, color: Colors.grey,),
                  SizedBox(height: 2.h,),
                  ProfileRow(prefixIcon: Icons.photo,
                      title: "Portfolio",
                      onPress: () {}),
                  SizedBox(height: 2.h,),
                  const Divider(
                    thickness: 2,),
                  SizedBox(height: 2.h,),
                  ProfileRow(prefixIcon: Icons.language,
                      title: "language",
                      onPress: () {}),
                  SizedBox(height: 2.h,),
                  const Divider(
                    thickness: 2, ),
                  SizedBox(height: 2.h,),
                  ProfileRow(prefixIcon: Icons.notifications,
                      title: "notification",
                      onPress: () {}),
                  SizedBox(height: 2.h,),
                  const Divider(
                    thickness: 2, ),
                  SizedBox(height: 2.h,),
                  ProfileRow(prefixIcon: Icons.security_rounded,
                      title: "loginAndSecurity",
                      onPress: () {}),
                  SizedBox(height: 2.h,),
                  const Divider(
                    thickness: 2,),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 7.h,
              color: const Color(0xffE5E7EB),
              child: PrimaryText(title: "Others", size: 20,),
            ),
            SizedBox(height: 3.h,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ProfileRow(title: "Accessibility",
                    onPress: () {},
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 2, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(title: "HelpCenter",
                    onPress: () {},
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 2, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(title:"TermsConditions",
                    onPress: () {},
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 2, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(title: "privacyPolicy",
                    onPress: () {},
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 2,),
                  SizedBox(height: 1.h,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
