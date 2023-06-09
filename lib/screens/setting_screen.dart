import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/screens/settings_screens/faq.dart';
import 'package:genkid/screens/settings_screens/html_editor/html_write.dart';
import 'package:genkid/screens/settings_screens/rate_screen.dart';
import 'package:genkid/screens/settings_screens/support_us.dart';
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
            SizedBox(height: 1.h,),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 7.h,
              color: const Color(0xffC6AEEA),
              child: PrimaryText(title:"General", size: 15.sp,),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ProfileRow(prefixIcon: Icons.person,
                      title: "Html Test",
                      onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HtmlWriteCode()));
                       }
                      ),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1, color: Colors.grey,),
                  SizedBox(height: 1.h,),
                  ProfileRow(prefixIcon: Icons.photo,
                      title: "Rate",
                      onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RateScreen(),));
                      }),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1,),
                  SizedBox(height: 1.h,),
                  ProfileRow(prefixIcon: Icons.language,
                      title: "language",
                      onPress: () {}),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(prefixIcon: Icons.notifications,
                      title: "notification",
                      onPress: () {}),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(prefixIcon: Icons.security_rounded,
                      title: "loginAndSecurity",
                      onPress: () {}),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1,),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 6.h,
              color: const Color(0xff8C8DF7),
              child: PrimaryText(title: "Others", size: 15.sp,),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ProfileRow(title: "Accessibility",
                    onPress: () {},
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(title: "FAQs",
                    onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FAQ(),));
                    },
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(title:"Support Us",
                    onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Support(),));
                    },
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1, ),
                  SizedBox(height: 1.h,),
                  ProfileRow(title: "privacyPolicy",
                    onPress: () {},
                    needSuffix: false,),
                  SizedBox(height: 1.h,),
                  const Divider(
                    thickness: 1,),
                  SizedBox(height: 1.h,),
                  ProfileRow(title: "LogOut",
                    onPress: () {
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
                    needSuffix: false,),
                   SizedBox(height: 1.h,),
                  // const Divider(
                  //   thickness: 2,),
                  // SizedBox(height: 1.h,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
