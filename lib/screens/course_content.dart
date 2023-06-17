import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
import 'package:sizer/sizer.dart';

class CourseContent extends StatefulWidget {
  @override
  _CourseContentState createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  @override
  void initState() {

     data=context.read<CoursesCubit>().CorseContentModel.data;
    super.initState();
  }

  var data;
  @override
  Widget build(BuildContext c) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    return BlocConsumer <CoursesCubit, CoursesState>(
      listener: (context, state) {
      // TODO: implement listener
    },
      builder: (context, state) {
        return Scaffold(
        backgroundColor: const Color(0xff5F40D1),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 55.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                  image: DecorationImage(image: AssetImage(AppImages.courseContent),fit: BoxFit.cover)
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_outlined)),
                  SizedBox(width: 23.w,),
                   Text('${data['playlistName'][0]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height:48.h,),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (context,index)=>
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                context.read<CoursesCubit>().currentVideo=data['videoURL'][index];
                                Navigator.pushNamed(context, AppRoutes.videoContentRoute);
                              },
                              child: Container(
                                height: _w / 4,
                                decoration: BoxDecoration(
                                  color: const Color(0xff5F40D1),
                                  borderRadius:(index==0)? const BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)):BorderRadius.zero,

                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 15,),
                                    CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white.withOpacity(0.3),
                                        child: const Icon(Icons.play_circle_fill_outlined,size: 38,)),
                                    const SizedBox(width: 15,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('video ${index+1}',style: const TextStyle(color: Colors.white)),
                                         Text('${data['title'][index]}',style: TextStyle(color: Colors.white,fontSize: 18)),
                                         Text('${data['playlistName'][0]}',style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(height: 1,thickness: 0.2,color: Colors.black,indent: 20,endIndent: 20,)
                          ],
                        )),
                  ),
                )

              ],
            )
          ],
        ),

      );
      },
    );
  }
}
