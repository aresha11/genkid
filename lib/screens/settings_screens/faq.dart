import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/utility/app_images.dart';
import '../../widgets/custum_appbar.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustumAppBar("FAQs")),
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
          Column(
            children: [
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    )),
                child: const ExpansionTile(
                  textColor: Colors.black,
                  title: Text(
                    'What is computer programming',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  children: <Widget>[
                    ListTile(
                        title: Text(
                            "Computer programming is the process of performing particular computations (or more generally, accomplishing specific computing results), usually by designing and building executable computer programs. Programming involves tasks such as analysis, generating algorithms, profiling algorithms' accuracy and resource consumption, and the implementation of algorithms (usually in a particular programming language, commonly referred to as coding).[1][2] The source code of a program is written in one or more languages that are intelligible to programmers, rather than machine code, which is directly executed by the central processing unit. The purpose of programming is to find a sequence of instructions that will automate the performance of a task (which can be as complex as an operating system) on a computer, often for solving a given problem. Proficient programming thus usually requires expertise in several different subjects, including knowledge of the application domain, specialized algorithms, and formal logic.")),
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    )),
                child: const ExpansionTile(
                  textColor: Colors.black,
                  title: Text(
                    'How programming is useful',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  children: <Widget>[
                    ListTile(
                        title: Text(
                            "Programming helps in speeding up the input and output processes in a machine. It is important to automate, collect, manage, calculate, and analyze the processing of data and information accurately. Programming helps create software and applications that help computer and mobile users in daily life.")),
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
