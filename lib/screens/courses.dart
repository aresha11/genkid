import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
import 'package:genkid/screens/course_content.dart';
import 'package:sizer/sizer.dart';
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
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  //padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context,index)=>
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
                    image: DecorationImage(image: NetworkImage(context.read<CoursesCubit>().playlistsModel.data[index].photo.toString()),fit:BoxFit.fitWidth)
                ),
                //  child: Image.network(context.read<CoursesCubit>().playlistsModel.data[index].photo.toString(),fit: BoxFit.cover,),

                 child: InkWell(
                    onTap: ()async{
                      await context.read<CoursesCubit>().getVideosById(playListId: context.read<CoursesCubit>().playlistsModel.data[index].id.toString());
                      //Navigator.pushNamed(context, AppRoutes.courseContentRoute);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CourseContent(index: index,),));
                    },
                    // child: Column(
                    //   children: [
                    //     Material(
                    //       elevation:20,
                    //     color: Colors.white.withOpacity(0.4),
                    //       borderRadius: BorderRadius.circular(25),
                    //       child: Container(
                    //         // padding: const EdgeInsets.all(20),
                    //         // height: MediaQuery.of(context).size.height*0.27,
                    //         // width: MediaQuery.of(context).size.width*0.8,
                    //
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //
                    //             // Row(
                    //             //   mainAxisAlignment: MainAxisAlignment.center,
                    //             //   children: [
                    //             //     Material(
                    //             //       elevation: 20,
                    //             //       shadowColor: Colors.black,
                    //             //       borderRadius: BorderRadius.circular(50),
                    //             //         child: CircleAvatar(
                    //             //             radius: 25,
                    //             //             backgroundColor: Colors.white.withOpacity(0.3),
                    //             //             child: const Icon(Icons.play_circle_fill_outlined,size: 38,))
                    //             //     ),
                    //             //   ],
                    //             // ),
                    //             // Column(
                    //             //   children:  [
                    //             //     Text(data[index].name.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    //             //     Text(data[index].autherName.toString())
                    //             //   ],
                    //             // )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(height: 30,)
                    //   ],
                    // ),
                  )),
                ],
              )
              ),
            ),
          ],
        ),
      ) ,
    );
  },
);
  }
}
