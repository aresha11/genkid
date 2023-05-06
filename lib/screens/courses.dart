import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  void initState() {
    context.read<CoursesCubit>().getAllCourses();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 4,
                  itemBuilder: (context,index)=>
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, AppRoutes.courseContentRoute);
                },
                child: Column(
                  children: [
                    Material(
                      elevation:20,
                    color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height*0.27,
                        width: MediaQuery.of(context).size.width*0.8,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  elevation: 20,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(50),
                                    child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white.withOpacity(0.3),
                                        child: const Icon(Icons.play_circle_fill_outlined,size: 38,))
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('course name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text('auther name')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,)
                  ],
                ),
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
