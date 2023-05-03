import 'package:flutter/material.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/app_strings.dart';
import 'package:genkid/widgets/input_field.dart';
import 'package:sizer/sizer.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFE9F2),
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImages.forgetPassword),
            SizedBox(height: 5.h,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFFFFFF),
                    Color(0xffF2F6FF),
                    Color(0xffAEBEDF),
                  ]
                )
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    "forget password?",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text(
                      "Enter the e-mail address  associated \nwith your account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                  SizedBox(
                    height: 4.h,
                  ),
                  InputField(
                      validated: (){},
                      onchange: (){},
                      onEditingComplete: (){},
                    prefixIcon: Icons.email,
                    hint: AppStrings.email,
                  ),
                  SizedBox(height: 3.h,),
                  const Text(
                      "send verification code",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  SizedBox(height: 3.h,),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff7F5BFF),
                            Color(0xff4624C2),
                          ]
                        )
                      ),
                      child: Image.asset(AppImages.rightArrow),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
