import 'package:flutter/material.dart';
import 'package:genkid/config/utility/app_colores.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/app_strings.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/auth/register_cubit/register_cubit.dart';
import '../../widgets/input_field.dart';
import '../../widgets/main_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var retypeEmailController = TextEditingController();

  var emailController = TextEditingController();

  var fullNameController = TextEditingController();

  var ageController = TextEditingController();

  var passwordController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffE4ECFB),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 100.h,
              child: Stack(
                children: [
                  Positioned(
                      top: 1.h,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        AppImages.registerPicture,
                        height: 30.h,
                        width: 90.w,
                      )),
                  Positioned(
                      top: 25.h,
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
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(AppStrings.createAccount,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800)),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Text(
                                  "hello let’s start to create \n our account",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                InputField(
                                  validated: (value) {
                                    if(value==""){
                                      return "Can’t be empty";
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  onchange: (v) {},
                                  onEditingComplete: (v) {},
                                  controller: fullNameController,
                                  prefixIcon: Icons.person,
                                  hint: AppStrings.fullName,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                InputField(
                                  validated: (value) {
                                    if(value==""){
                                      return "Can’t be empty";
                                    }else
                                      {
                                        return null;
                                      }
                                  },
                                  onchange: (v) {},
                                  onEditingComplete: (v) {},
                                  controller: emailController,
                                  prefixIcon: Icons.email,
                                  hint: AppStrings.email,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                InputField(
                                  validated: (v) {
                                    if(v!=emailController.text){
                                      return "Don’t Match Email";
                                    }else
                                      {
                                        return null;
                                      }
                                  },
                                  onchange: (v) {},
                                  onEditingComplete: (v) {},
                                  controller: retypeEmailController,
                                  prefixIcon: Icons.email,
                                  hint: AppStrings.retypeEmail,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                InputField(
                                  secure: true,
                                  suffixIcon: Icons.remove_red_eye,
                                  validated: (value) {
                                    if(value==""){
                                      return "Can’t be empty";
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  onchange: (v) {},
                                  onEditingComplete: (v) {},
                                  controller: passwordController,
                                  prefixIcon: Icons.lock,
                                  hint: AppStrings.password,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                InputField(
                                  validated: (value) {
                                    if(value==""){
                                      return "Can’t be empty";
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  onchange: (v) {},
                                  onEditingComplete: (v) {},
                                  controller: ageController,
                                  prefixIcon: Icons.calendar_month,
                                  hint: AppStrings.age,
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 1.8.h,
                                ),

                                MainButton(
                                  title: AppStrings.createAccount,
                                  color: Colors.white,
                                  onPressed: () {
                                    if(formKey.currentState!.validate()){
                                      context.read<RegisterCubit>().register(
                                          firstName: fullNameController.text,
                                          userName: retypeEmailController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          age: int.parse(ageController.text),
                                          context: context);

                                    }


                                  //  context.read<CoursesCubit>().getAllCourses();
                                    // Navigator.pushNamed(context, AppRoutes.homeScreenLayoutRoute);
                                  },
                                ),

                                Row(
                                  children: [
                                    Text(
                                      AppStrings.alreadyHaveAnAccount,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed(AppRoutes.loginScreenRoute);
                                        },
                                        child: Text(
                                          AppStrings.login,
                                          style: const TextStyle(fontSize: 12),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
