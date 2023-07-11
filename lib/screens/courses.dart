import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
import 'package:genkid/screens/course_content.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  void initState() {
    context.read<CoursesCubit>().getAllCourses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var data=context.read<CoursesCubit>().playlistsModel.data;
    return BlocConsumer<CoursesCubit, CoursesState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/bg.jpeg'),fit: BoxFit.fill)
        ),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*.1),
              child: Row(
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back,size: 30,))
                ],
              ),
            ),

            ToggleSwitch(
              changeOnTap: true,
              minWidth: 30.w,
              cornerRadius: 22.0,
              fontSize: 12.sp,
              minHeight: 7.h,
              activeBgColor: const [Color(0xff210228FF),Color(0xff40002EFF)],
              //activeBgColors: [[AppColors.primaryColor], [AppColors.primaryColor]],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.transparent,
              inactiveFgColor: const Color(0xff6B7280),
              initialLabelIndex:
              context.read<CoursesCubit>().currentIndex,
              totalSwitches: 3,
              labels: const [
                "Beginner",
                "Average",
                "Advanced"
              ],
              radiusStyle: true,
              onToggle: (index) {
                context.read<CoursesCubit>().changeIndex(index);
              },
            ),
            ConditionalBuilder(
              builder: (context) {
                if (context.read<CoursesCubit>().currentIndex == 2) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: context.read<CoursesCubit>().playlistsModel1.data.length,
                        //padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context,index)=>
                        state is LoadingCoursesState?
                        Container(
                          margin: EdgeInsets.only(left: 40.w,right: 40.w,bottom: 10.h),

                          height: 10.h,
                          width: 1.w,
                          child: const CircularProgressIndicator(color: Colors.black),
                        )
                            :
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height*0.27,
                                width: MediaQuery.of(context).size.width*0.8,
                                decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(20),
                                    color: Colors.black,
                                    image: DecorationImage(image: NetworkImage(context.read<CoursesCubit>().playlistsModel3.data[index].photo.toString()),fit:BoxFit.fill)
                                ),
                                //  child: Image.network(context.read<CoursesCubit>().playlistsModel.data[index].photo.toString(),fit: BoxFit.cover,),

                                child: InkWell(
                                  onTap: ()async{
                                    await context.read<CoursesCubit>().getVideosById(playListId: context.read<CoursesCubit>().playlistsModel3.data[index].id.toString());
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CourseContent(index: index,playlistLevel: 3),));
                                  },
                                )),
                          ],
                        )
                    ),





                  );
                } else {

                  return Expanded(
                    child: ListView.builder(
                        itemCount: context.read<CoursesCubit>().playlistsModel2.data.length,
                        //padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context,index)=>
                        state is LoadingCoursesState?
                        Container(
                          margin: EdgeInsets.only(left: 40.w,right: 40.w,bottom: 10.h),

                          height: 10.h,
                          width: 1.w,
                          child: const CircularProgressIndicator(color: Colors.black),
                        )
                            :
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height*0.27,
                                width: MediaQuery.of(context).size.width*0.8,
                                decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(20),
                                    color: Colors.black,
                                    image: DecorationImage(image: NetworkImage(context.read<CoursesCubit>().playlistsModel2.data[index].photo.toString()),fit:BoxFit.fill)
                                ),
                                //  child: Image.network(context.read<CoursesCubit>().playlistsModel.data[index].photo.toString(),fit: BoxFit.cover,),

                                child: InkWell(
                                  onTap: ()async{
                                    await context.read<CoursesCubit>().getVideosById(playListId: context.read<CoursesCubit>().playlistsModel2.data[index].id.toString());
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CourseContent(index: index,playlistLevel: 2),));
                                  },
                                )),
                          ],
                        )
                    ),





                  );
                }
              },
              condition:
              context.read<CoursesCubit>().currentIndex == 1 ||
                  context.read<CoursesCubit>().currentIndex == 2,
              fallback: (context) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: context.read<CoursesCubit>().playlistsModel1.data.length,
                      //padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context,index)=>
                      state is LoadingCoursesState?
                      Container(
                        margin: EdgeInsets.only(left: 40.w,right: 40.w,bottom: 10.h),

                        height: 10.h,
                        width: 1.w,
                        child: const CircularProgressIndicator(color: Colors.black),
                      )
                          :
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height*0.27,
                              width: MediaQuery.of(context).size.width*0.8,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(20),
                                  color: Colors.black,
                                  image: DecorationImage(image: NetworkImage(context.read<CoursesCubit>().playlistsModel1.data[index].photo.toString()),fit:BoxFit.fill)
                              ),

                              child: InkWell(
                                onTap: ()async{
                                  await context.read<CoursesCubit>().getVideosById(playListId: context.read<CoursesCubit>().playlistsModel1.data[index].id.toString());
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseContent(index: index,playlistLevel: 1),));
                                },
                              )),
                        ],
                      )
                  ),
                );
              },
            )

          ],
        ),
      ) ,
    );
  },
);
  }
}
