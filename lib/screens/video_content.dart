import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class VideoContent extends StatefulWidget {

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller=VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {

        });
      });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
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

                    _controller.value.isInitialized? AspectRatio(aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller)):
                    CircularProgressIndicator(),

                  ),
                  Positioned(
                      left: 15,
                      top: 10,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,))),
                  Positioned(
                    bottom: 2,
                    child:
                    Row(
                      children: [
                        IconButton(onPressed: (){

                          _controller.value.isPlaying ? _controller.pause() : _controller.play() ;
                          setState(() {

                          });
                        }, icon: _controller.value.isPlaying ? Icon(Icons.pause,size: 35,): Icon(Icons.play_arrow,size: 35,)),
                        Container(
                          width: 320,
                          child: VideoProgressIndicator(
                              _controller,allowScrubbing: true ,colors: VideoProgressColors(
                              backgroundColor: Colors.white
                          )),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.fullscreen_exit_rounded,size: 35,))
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
                      Text('Product Design v1.0',style: TextStyle(color: Color(0xff1F1F39),fontWeight: FontWeight.w700,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text('6h 14min · 24 Lessons',style: TextStyle(color: Color(0xff858597),fontWeight: FontWeight.w400,fontSize: 12), ),
                      SizedBox(height: 20,),
                      Text('About this course',style: TextStyle(color: Color(0xff1F1F39),fontWeight: FontWeight.w700,fontSize: 16),),
                      SizedBox(height: 10,),
                      Text('Sed ut perspiciatis unde omnis iste natus error sit\nvoluptatem accusantium doloremque laudantium,',style: TextStyle(color: Color(0xff9393A3),fontWeight: FontWeight.w400,fontSize: 12), ),
                      SizedBox(height: 70,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('01',style: TextStyle(color: Color(0xffB8B8D2),fontWeight: FontWeight.w500,fontSize: 24), ),
                          Column(
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
                          Column(
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
                          Column(
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
      ),
    );
  }
}

