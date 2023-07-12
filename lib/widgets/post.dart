import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/cubit/posts_cubit/posts_cubit.dart';
import 'package:rate/rate.dart';
import 'package:sizer/sizer.dart';

class Post extends StatelessWidget {
   Post({Key? key,required this.index}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          children: [
            CircleAvatar(
                radius:6.w,
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),

                )
            ),
            SizedBox(
              width: 1.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${context.read<PostsCubit>().postsModel.data[index].userName}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "16h .",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          '${context.read<PostsCubit>().postsModel.data[index].post}',
          style: TextStyle(fontSize: 8.sp),
        ),
        SizedBox(
          height: 10,
        ),
        const Divider(color: Colors.black,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Rate(
              iconSize: 25,
              color: Colors.green,
              allowHalf: true,
              allowClear: true,
              initialValue: 3.5,
              readOnly: false,
            ),
            const Expanded(child: SizedBox()),
            TextButton(onPressed: (){}, child: const Text('share',style: TextStyle(fontSize: 22,fontWeight:FontWeight.w400,color: Colors.black),),),
          ],),
        const Divider(color: Colors.black,),

      ],
    ),
  );
  }
}





// class CircleProfileAvatar extends StatelessWidget {
//   final double size;
//
//   const CircleProfileAvatar({this.size=20,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//         children: [
//           CircleAvatar(
//               radius:size,
//               child: CircleAvatar(
//                 radius: 20,
//                 child: Icon(Icons.person),
//
//               )
//           ),
//         ]
//     );
//   }
// }

