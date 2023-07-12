import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedRoadMap extends StatefulWidget {
  const DetailedRoadMap({Key? key}) : super(key: key);

  @override
  State<DetailedRoadMap> createState() => _DetailedRoadMapState();
}

class _DetailedRoadMapState extends State<DetailedRoadMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration:  const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/R.jpg'), fit: BoxFit.fill)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   InkWell(
                     onTap: (){
                       showDialog(context: context, builder: (context)=>AlertDialog(
                         content: Container(
                           height: 100,
                           width: 200,
                           child: Column(
                             children: [
                               Text('bootstrap'),
                               TextButton(child: Text('show course'),onPressed: (){
                                 launch("https://youtube.com/playlist?list=PLDoPjvoNmBAw24EjNUp_88S1VeaNK8Cts");

                               },)
                             ],
                           ),
                         ),
                       ));
                     },
                     child:  Container(
                       alignment: Alignment.center,
                       margin: EdgeInsets.only(
                           right: MediaQuery.of(context).size.width * 0.01,
                           top: MediaQuery.of(context).size.height*0.07),
                       height: MediaQuery.of(context).size.height * 0.14,
                       width: MediaQuery.of(context).size.width * 0.25,
                       decoration: BoxDecoration(
                           color: Colors.indigo,
                           borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(25),
                               topRight: Radius.circular(25),
                               bottomRight: Radius.circular(25))),
                       child: Text('step 4',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),

                     ),
                   ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          content: Container(
                            height: 200,
                            width: 200,
                            child: Column(
                              children: [
                                Text('javaScript'),
                                TextButton(child: Text('show course'),onPressed: (){
                                  launch("https://youtube.com/playlist?list=PLDoPjvoNmBAw6p0z0Ek0OjPzeXoqlFlCh");

                                },)
                              ],
                            ),
                          ),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            top: MediaQuery.of(context).size.height*0.03),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        child: Text('step 3',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),

                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          content: Container(
                            height: 100,
                            width: 200,
                            child: Column(
                              children: [
                                Text('CSS'),
                                TextButton(child: Text('show course'),onPressed: (){
                                  launch("https://youtube.com/playlist?list=PLDoPjvoNmBAzAeIcXA3_JsmSkPKOs9W-Y");

                                },)
                              ],
                            ),
                          ),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02,
                            top: MediaQuery.of(context).size.height*0.03),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        child: Text('step 2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),

                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          content: Container(
                            height: 100,
                            width: 200,
                            child: Column(
                              children: [
                                Text('html'),
                                TextButton(child: Text('show course'),onPressed: (){
                                  launch("https://youtube.com/playlist?list=PLDoPjvoNmBAwClZ1PDcjWilxp9YERUbNt");

                                },)
                              ],
                            ),
                          ),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.20,
                            top: MediaQuery.of(context).size.height*0.03),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        child: Text('step 1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
