import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_status/flutter_progress_status.dart';
import 'package:genkid/widgets/post.dart';
import 'package:progress_border/progress_border.dart';
import 'package:sizer/sizer.dart';

import '../config/utility/app_images.dart';
import '../cubit/posts_cubit/posts_cubit.dart';

class PostsScreen extends StatefulWidget {
 const  PostsScreen({Key? key}) : super(key: key);
  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  void initState() {

    context.read<PostsCubit>().getPosts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1D5C92),
            elevation: 0,
            centerTitle: true,
            title: Text("Post", style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w600,color: Colors.white,),),
          ),
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
              SizedBox(
                height: 90.h,
                child: ListView.builder(
                  itemCount:state is LoadingGetPostState?1: context.read<PostsCubit>().postsModel.data.length,
                  itemBuilder: (context, index) =>
                      state is LoadingGetPostState?
                  Center(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40.h,),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            child: CircularProgressIndicator(
                              color: const Color(0xff1D5C92),
                            ),
                          ),
                        ],
                      ),
                  )
                :
                      Column(
                    children: [
                      SizedBox(height: 1.h,),
                      Post(index: index),
                    ],
                  ),),
              )
            ],
          ),
        );
      },
    );
  }
}
