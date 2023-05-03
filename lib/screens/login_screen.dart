import 'package:flutter/material.dart';
import 'package:genkid/config/utility/app_colores.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/app_strings.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:sizer/sizer.dart';
import '../widgets/input_field.dart';
import '../widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4ECFB),
      body: Stack(
        children: [
          Positioned(
              top: 1.h,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.loginPicture,
                height: 35.h,
                width: 90.w,
              )),
          Positioned(
              top: 37.h,
              left: 0,
              right: 0,
              child: Container(
                width: 90.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffFFFFFF),
                        Color(0xffF2F6FF),
                        Color(0xffAEBEDF),
                      ]),
                  // image: const DecorationImage(
                  //   image: AssetImage("assets/logo.png")
                  // ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(AppStrings.login,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w800)),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Text(
                        "welcome Back You Have Been Missed",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      InputField(
                        validated: () {},
                        onchange: () {},
                        onEditingComplete: () {},
                        controller: emailController,
                        prefixIcon: Icons.email,
                        hint: AppStrings.email,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InputField(
                        secure: true,
                        suffixIcon: Icons.remove_red_eye,
                        validated: () {},
                        onchange: () {},
                        onEditingComplete: () {},
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        hint: AppStrings.password,
                      ),
                      TextButton(
                          onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.forgetPassword);
                          },
                          child: Text(AppStrings.forgotPassword)),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      MainButton(
                        title: AppStrings.login,
                        color: AppColors.primaryColorDark,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.homeScreenLayoutRoute);
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(AppStrings.doNotHaveAnAccount),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.registerScreenRoute);
                              },
                              child: Text(
                                AppStrings.createAccount,
                                style: TextStyle(fontSize: 10),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
