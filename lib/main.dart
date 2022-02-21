import 'dart:convert';

import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:ui_practice/context_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      initialRoute: '/',
      getPages: [
        GetPage(name: "/", page: () => Home())
      ],
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) =>
    {
      info = json.decode(value)
    });
  }
  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    Context controller = Get.put(Context());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Training", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),),
                  Expanded(child: Container()),
                  Icon(Icons.arrow_back_ios, size: 20,),
                  SizedBox(width: 10,),
                  Icon(Icons.calendar_today_outlined, size: 20,),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_ios, size: 20,),
            ]
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Text("Your Program", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Expanded(child: Container()),
                  Text("Detail", style: TextStyle(fontSize: 18, color: Colors.lightBlue),),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward,size: 20,)
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80),
                    ),
                    gradient: LinearGradient(
                       colors: [
                        Colors.blueAccent,
                        Colors.lightBlueAccent
                      ]
                    ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(0.4)
                    )
                  ]
                ),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Next workout", style: TextStyle(fontSize: 16, color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("Legs Tonight", style: TextStyle(fontSize: 25, color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("and Glutes Workout", style: TextStyle(fontSize: 25, color: Colors.white),),
                      SizedBox(height: 25,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer, size: 20, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("60 min", style: TextStyle(fontSize: 12, color: Colors.white),)
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(offset: Offset(-3,4), color: Colors.blue, blurRadius: 10)
                              ],
                            ),
                            child: Icon(Icons.play_circle, size: 50, color: Colors.white,),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.only(top: 25),
                height: 180,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(offset: Offset(1,1), color: Colors.grey.withOpacity(0.8), blurRadius: 10)
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/card.jpg"),
                          fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 180,
                      margin: const EdgeInsets.only(left: 40, bottom: 30),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/figure.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 120,
                      margin: EdgeInsets.only(left: 180, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Your are doing great", style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1
                          ),
                          ),
                          const SizedBox(height: 10,),
                          RichText(text: const TextSpan(
                            text: "keep it up",
                            style: TextStyle(color: Colors.grey, fontSize: 16),)),
                          const Text("stick to your plan", style: TextStyle(color: Colors.grey, fontSize: 16),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Area of focus", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: 50,),
              Expanded(child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: info.length.toDouble()~/2,
                    itemBuilder: (_, i) {
                      int a = 2*i;
                      int b = 2*i + 1;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 200,
                            padding: EdgeInsets.only(bottom: 20),
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  info[a]['img']
                                )
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1,1),
                                  blurRadius: 10,
                                  color: Colors.grey.withOpacity(0.2)
                                ),
                                BoxShadow(
                                  offset: Offset(-1,-1),
                                  blurRadius: 10,
                                  color: Colors.grey.withOpacity(0.1)
                                )
                              ]
                            ),
                            child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                    child: Text(info[a]['title'], style: TextStyle(color: Colors.grey),)
                                )
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 200,
                            padding: EdgeInsets.only(bottom: 20),
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  info[b]['img']
                                )
                              ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                BoxShadow(
                                  offset: Offset(1,1),
                                  blurRadius: 10,
                                  color: Colors.grey.withOpacity(0.2)
                                ),
                                BoxShadow(
                                  offset: Offset(-1,-1),
                                  blurRadius: 10,
                                  color: Colors.grey.withOpacity(0.2)
                                )
                              ]
                            ),
                            child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                    child: Text(info[b]['title'], style: TextStyle(color: Colors.grey),)
                                )
                            ),
                          ),
                        ],
                      );
                    }
                ),
              ))

            ],
          ),
        ),
    );
  }
}

