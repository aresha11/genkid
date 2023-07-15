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

    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)
    ),
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
            Text(
              "${context.read<PostsCubit>().postsModel.data[index].userName}",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            '${context.read<PostsCubit>().postsModel.data[index].post}',
            style: TextStyle(fontSize: 9.sp),
          ),
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

