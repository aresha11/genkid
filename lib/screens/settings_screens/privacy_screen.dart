import 'package:flutter/material.dart';

import '../../config/utility/app_images.dart';
class Privacy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            ListView(

              padding: EdgeInsets.all(30),
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back)),
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Text('Privacy ',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25 ),),

                    Text('policy',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25,color: Color(0xff1D5C92) ),),

                  ],
                ),
                SizedBox(height: 15,),
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                    ', sed do eiusmd tempor incididunt ut labore et'
                    ' dolore magna aliqua Lorem ipsum dolor sit amet,'
                    ' consectetur adipiscing elit, sed do eiusmd tempor'
                    ' incididunt ut labore et dolore magna aliqua. Lorem '
                    'ipsum dolor sit amet, consectetur adipiscing elit,'
                    ' sed do eiusmd tempor incididunt ut labore'
                    ' et dolore magna aliqua. Lorem ipsum dolor sit amet,'
                    ' consectetur adipiscing elit, sed do eiusmd tempor incididunt'
                    ' ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet,'
                    ' consectetur adipiscing elit, sed do eiusmd tempor '
                    'incididunt ut labore et dolore magna aliqua. Lorem '
                    'ipsum dolor sit amet, consectetur adipiscing elit,'
                    ' sed do eiusmd tempor incididunt ut labore et dolore magna aliqua.'
                    ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmd'
                    ' tempor incididunt ut labore et dolore magna aliqua.'
                    ' Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                    ' sed do eiusmd tempor incididunt ut labore et dolore magna aliqua.'
                    ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmd'
                    ' tempor incididunt ut labore et dolore magna aliqua.'
                    ' Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                    ' sed do eiusmd tempor incididunt ut labore et dolore magna aliqua. '
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmd tempor incididunt ut labore et dolore magna aliqua.'
                    ' Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                    ' sed do eiusmd tempor incididunt ut labore et dolore magna aliqua. '
                    'Lorem ipsum dolor sit amet, consectetur adipiscing'

                    ' elit, sed do eiusmd tempor incididunt ut labore et'
                    ' dolore magna aliqua. Lorem ipsum dolor sit amet,'
                    ' consectetur adipiscing elit, sed do eiusmd tempor'
                    ' incididunt ut labore et dolore magna aliqua.  ')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
