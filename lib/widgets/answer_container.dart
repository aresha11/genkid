import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/cubit/Quizs_cubit/quizs_cubit.dart';
import 'package:sizer/sizer.dart';

class AnswerContainer extends StatefulWidget {
  AnswerContainer({Key? key, required this.index,required this.answers,required this.correct}) : super(key: key);

  int index;
  String answers;
  String correct;
  Color secondContainerColor = const Color(0xff7F5BFF);
  Color firstContainerColor = const Color(0xff4624C2);

  @override
  State<AnswerContainer> createState() => _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if(widget.answers== widget.correct){
              widget.firstContainerColor = const Color(0xff0B953A);
              widget.secondContainerColor = const Color(0xff24C22B);
            }else{
              widget.firstContainerColor=const Color(0xffC61313);
              widget.secondContainerColor=const Color(0xffC61313);
            }

            Future.delayed(Duration(milliseconds: 800),() {
              context.read<QuizsCubit>().changeIndex();
              widget. secondContainerColor = const Color(0xff7F5BFF);
              widget.  firstContainerColor = const Color(0xff4624C2);
              setState(() {

              });
            },);


            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            height: 8.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                widget.firstContainerColor,
                widget.secondContainerColor,
              ]),
              //color: widget.containerColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Text(widget.answers),
          ),
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    );
  }
}
