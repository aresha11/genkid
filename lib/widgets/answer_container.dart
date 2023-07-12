import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/cubit/Quizs_cubit/quizs_cubit.dart';
import 'package:sizer/sizer.dart';

class AnswerContainer extends StatefulWidget {
  AnswerContainer(
      {Key? key,
      required this.index,
      required this.answers,
      required this.correct})
      : super(key: key);

  int index;
  String answers;
  String correct;
  Color secondContainerColor = const Color(0xff7F5BFF);
  Color firstContainerColor = const Color(0xff4624C2);

  @override
  State<AnswerContainer> createState() => _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  String? newOptions;
  String? newCorrect;

  removeAnswer(options) {
    List<String> words = options.split(' ');
    words = words.sublist(1); // Remove the first word
    newOptions = words.join('');
  }

  removeCorrect(correct) {
    List<String> words = correct.split(' ');
    newCorrect = words.join('');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              removeAnswer(widget.answers);
              removeCorrect(widget.correct);
              if (newOptions == newCorrect) {
                widget.firstContainerColor = const Color(0xff0B953A);
                widget.secondContainerColor = const Color(0xff24C22B);
                SharedPreference.put(
                    key: "correct",
                    value:
                        SharedPreference.get(key: "correct").toString() == "null"
                            ? 1
                            : SharedPreference.get(key: "correct") + 1);
              } else {
                widget.firstContainerColor = const Color(0xffC61313);
                widget.secondContainerColor = const Color(0xffC61313);
              }

              Future.delayed(
                Duration(milliseconds: 500),
                () {
                  context.read<QuizsCubit>().changeIndex(context);
                  widget.secondContainerColor = const Color(0xff7F5BFF);
                  widget.firstContainerColor = const Color(0xff4624C2);
                  setState(() {});
                },
              );

              setState(() {});
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  widget.firstContainerColor,
                  widget.secondContainerColor,
                ]),
                //color: widget.containerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.answers,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          )
        ],
      ),
    );
  }
}
