import 'package:emoji_rating_bar/emoji_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/utility/app_images.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: Text("Rate App",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300,color: Colors.black),),
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
          Container(
            child: Center(
              child: EmojiRatingBar(
                  rating: 2,
                  onRateChange: (rating) {
                    print(rating);
                  },
                  isReadOnly: false,
                  spacing: 10,
                  size: 40,
                  selectedSize: 70,
                  isShowTitle: true,
                  isShowDivider: false,
                  titleStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  selectedTitleStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                  animationDuration: const Duration(milliseconds: 500),
                  animationCurve: Curves.easeInOut,
                  ratingBarType: RatingBarType.feedback,
                  applyColorFilter: true),
            ),
          ),
        ],
      ),
    );
  }
}
