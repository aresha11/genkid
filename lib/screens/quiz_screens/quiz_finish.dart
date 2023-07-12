import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/cubit/Quizs_cubit/quizs_cubit.dart';




class QuizFinish extends StatefulWidget {
  const QuizFinish({Key? key}) : super(key: key);

  @override
  State<QuizFinish> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<QuizFinish> {

  int rightQuestion=SharedPreference.get(key: "correct");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(child: Text('your result',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30))),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*(rightQuestion/10),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: rightQuestion,
                    itemBuilder: (context,index)=>FadeTransitionExample(),),
                ),
              ),
              const SizedBox(height: 30,),
              Center(
                child:Stack(
                  children: [
                    Positioned(child: Container(
                      height: MediaQuery.of(context).size.width*0.4,
                      width: MediaQuery.of(context).size.width*0.4,
                      child:Center(child: Text('$rightQuestion/5',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
                    ),),
                    Container(
                      height: MediaQuery.of(context).size.width*0.4,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: rightQuestion/5,
                        backgroundColor: Colors.white,
                        color: Colors.indigo,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black)
                    ),
                    height: 80,
                    width: 150,
                    child: const Text('back home',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                  ),
                  InkWell(
                    onTap: (){
                      context.read<QuizsCubit>().changVideoId();
                      Navigator.pop(context);
                      SharedPreference.put(key: "correct", value: 0);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.black)
                      ),
                      height: 80,
                      width: 150,
                      child: Text((rightQuestion<3)?'try again':'go to next video',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                    ),
                  ),

                ],
              )
            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({Key? key, }) : super(key: key);

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(padding: EdgeInsets.all(8), child: Icon(Icons.star)),
      ),
    );
  }
}