import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/utility/app_images.dart';
import '../../config/utility/constant_method.dart';
import '../../widgets/custum_appbar.dart';
import '../../widgets/input_field.dart';


class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  var emailController =TextEditingController();
  var nameController =TextEditingController();
  var supController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustumAppBar("Support Us")),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.backGround,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 18,),
                  InputField(
                    controller:nameController ,
                    validated: (String value) {
                      if (value.trim().isEmpty) {
                        return "InValid";
                      } else {
                        return null;
                      }
                    },
                    hint: ("Name"),
                    prefixIcon: Icons.person,
                    onchange: (v){

                    },
                    onEditingComplete: (v){},
                  ),
                  SizedBox(height: 10,),
                  InputField(
                    validated: (String value) {
                      if (value.trim().isEmpty) {
                        return "InValid";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    hint: ("Email"),
                    prefixIcon: Icons.email,
                    onchange: (v){

                    },
                    onEditingComplete: (v){},
                  ),
                  SizedBox(height: 10,),
                  InputField(
                    controller: supController,
                    prefixIcon: null,
                    validated: (String value) {
                      if (value.trim().isEmpty) {
                        return "InValid";
                      } else {
                        return null;
                      }
                    },
                    hint: ("Description"),
                    maxLines: 8,
                    onchange: (v){

                    },
                    onEditingComplete: (v){},
                  ),
                  SizedBox(height: 5.h,),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 12.w)),
                    ),
                      onPressed: (){
                        flutterToast(msg: "Thanks For Your Support",color: Colors.green);
                        emailController.text="";
                        nameController.text="";
                        supController.text="";
                        Navigator.pop(context);
                        setState(() {

                        });
                      },
                      child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14.sp),))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}