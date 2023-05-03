import 'package:flutter/material.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:sizer/sizer.dart';
class RoadMap extends StatelessWidget {
  const RoadMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backGround), fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: 4,
          padding: const EdgeInsets.only(left: 25, top: 35, right: 25),
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: (index % 2 == 0)
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              (index % 2 == 0)
                  ? Container(
                alignment: Alignment.center,
                width: 37.w,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 23.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height:
                            MediaQuery.of(context).size.height * 0.1,
                            child: Image.asset('images/course$index.png'))
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'course name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )
                  : const Expanded(
                  child: Text('links to material \n we prefer',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16))),
              const SizedBox(
                width: 15,
              ),
              (index % 2 == 0)
                  ? const Expanded(
                  child: Text('links to material\n we prefer',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),textAlign: TextAlign.center,))
                  : Container(
                width: 35.w,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 23.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height:
                            MediaQuery.of(context).size.height * 0.1,
                            child: Image.asset('images/course$index.png'))
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'course name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}