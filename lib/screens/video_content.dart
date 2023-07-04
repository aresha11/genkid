import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContent extends StatefulWidget {
  VideoContent({required this.id,required this.index});
  String id;
  int index;

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  late YoutubePlayerController _controller2 ;
  @override
  void initState() {
    _controller2 = YoutubePlayerController(initialVideoId:
     url('${context.read<CoursesCubit>().corseContentModel.data[widget.index].video}'),
        //"l8xd_NzDYuE",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )
      ..initialVideoId;
        setState(() {

        });
    _controller2.addListener(_onPlayerStateChange);
    super.initState();

  }

  void _onPlayerStateChange() {
    bool z=SharedPreference.get(key: "videoId").toString()=="null"?true:widget.index>=SharedPreference.get(key: "videoId")?true:false;
    if (_controller2.value.playerState == PlayerState.ended) {
      //Video has ended
       if(z==true){
        if(widget.id=="2"){
          SharedPreference.put(key: "htmlQuizId", value: SharedPreference.get(key: "htmlQuizId").toString()=="null"?17:SharedPreference.get(key: "htmlQuizId")+1);
          SharedPreference.put(key: "quizType", value: "html");
        }else{
          SharedPreference.put(key: "scratchQuizId", value: SharedPreference.get(key: "scratchQuizId").toString()=="null"?22:SharedPreference.get(key: "scratchQuizId")+1);
          SharedPreference.put(key: "quizType", value: "scratch");
       }
      }

     SharedPreference.put(key: "quiz", value: true);
     Navigator.pushReplacementNamed(context, AppRoutes.quizSplashScreenRoute);
     _controller2.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      body: Column(

        children: [
          Expanded(

            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child:

                  YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: _controller2,showVideoProgressIndicator: true,),
                    builder: (context, player) {
                      return YoutubePlayer(controller: _controller2);
                    },)

                ),
                // Positioned(
                //     left: 15,
                //     top: 10,
                  //  child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,))),
                Positioned(
                  bottom: 2,
                  child:
                  Row(
                    children: [
                      IconButton(onPressed: (){

                        _controller2.value.isPlaying ? _controller2.setVolume(100) : _controller2.play() ;
                        setState(() {

                        });
                      },
                          icon: _controller2.value.isPlaying ? Icon(Icons.pause,size: 35,): Icon(Icons.play_arrow,size: 35,)),
                      // Container(
                      //   width: 320,
                      //   child: VideoProgressIndicator(
                      //       _controller2,allowScrubbing: true ,colors: VideoProgressColors(
                      //       backgroundColor: Colors.white
                      //   )),
                      // ),
                     // IconButton(onPressed: (){}, icon: const Icon(Icons.fullscreen_exit_rounded,size: 35,))
                    ],
                  ),),

              ],
            ),
          ),
          Expanded(
              flex:2,
              child: Container(
                // alignment: Alignment.topLeft,
                padding: EdgeInsets.only(right: 20,left: 20,top: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Product Design v1.0',style: TextStyle(color: Color(0xff1F1F39),fontWeight: FontWeight.w700,fontSize: 20),),
                    const SizedBox(height: 10,),
                    const Text('6h 14min · 24 Lessons',style: TextStyle(color: Color(0xff858597),fontWeight: FontWeight.w400,fontSize: 12), ),
                    const SizedBox(height: 20,),
                    const Text('About this course',style: TextStyle(color: Color(0xff1F1F39),fontWeight: FontWeight.w700,fontSize: 16),),
                    SizedBox(height: 10,),
                    Text('Sed ut perspiciatis unde omnis iste natus error sit\nvoluptatem accusantium doloremque laudantium,',style: TextStyle(color: Color(0xff9393A3),fontWeight: FontWeight.w400,fontSize: 12), ),
                    SizedBox(height: 70,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('01',style: TextStyle(color: Color(0xffB8B8D2),fontWeight: FontWeight.w500,fontSize: 24), ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to the Course',style: TextStyle(color: Color(0xff1F1F39),fontWeight: FontWeight.w400,fontSize: 14), ),
                            SizedBox(height: 5,),
                            Text('6:10  mins ',style: TextStyle(color: Color(0xffFF6905),fontWeight: FontWeight.w400,fontSize: 14), ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Image.asset('images/play.png')

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('02',style: TextStyle(color: Color(0xffB8B8D2),fontWeight: FontWeight.w500,fontSize: 24), ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to the Course',style: TextStyle(color: Color(0xff1F1F39),fontWeight: FontWeight.w400,fontSize: 14), ),
                            SizedBox(height: 5,),
                            Text('6:10  mins ',style: TextStyle(color: Color(0xffFF6905),fontWeight: FontWeight.w400,fontSize: 14), ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Image.asset('images/play.png')

                      ],
                    ),
                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('03',style: TextStyle(color: Color(0xffB8B8D2),fontWeight: FontWeight.w500,fontSize: 24), ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to the Course',style: TextStyle(color: Color(0xff1F1F39),fontWeight: FontWeight.w400,fontSize: 14), ),
                            SizedBox(height: 5,),
                            Text('6:10  mins ',style: TextStyle(color: Color(0xffFF6905),fontWeight: FontWeight.w400,fontSize: 14), ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Image.asset('images/play.png')

                      ],
                    ),
                  ],
                ),
              ))



        ],
      ) ,
    );
  }
}

String url(url){
  return YoutubePlayer.convertUrlToId(url).toString();

}