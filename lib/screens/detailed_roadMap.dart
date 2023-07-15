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
                           height: 50,

                           child: Column(
                             children: [
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
                           right: MediaQuery.of(context).size.width * 0.05,
                           top: MediaQuery.of(context).size.height*0.07),
                       height: MediaQuery.of(context).size.height * 0.1,
                       width: MediaQuery.of(context).size.width * 0.2,
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
                            height: 50,
                            child: Column(
                              children: [
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
                            left: MediaQuery.of(context).size.width * 0.08,
                            top: MediaQuery.of(context).size.height*0.05),
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.21,
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
                            height: 50,
                            child: Column(
                              children: [
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
                            right: MediaQuery.of(context).size.width * 0.07,
                            top: MediaQuery.of(context).size.height*0.06),
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.22,
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
                            height: 50,

                            child: Column(
                              children: [

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
                            left: MediaQuery.of(context).size.width * 0.32,
                            top: MediaQuery.of(context).size.height*0.13),
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.23,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        child: const Text('step 1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
