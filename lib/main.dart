import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  AnimationController animationController;


  Animation animation;
  Animation animation2;
  Animation animationMove1;
  Animation animationMove2;
  Animation animationMove3;
  Animation animation3;
  Animation animationOpacity;
  Animation animationWidth;
  Animation animationHeight;
  Animation animationPadding;
  Animation animationBorderRadius;
  Animation animationColor1;
  Animation animationColor2;

  double _angle1;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);

    animationController.addListener(() {
      setState(() {
        _angle1 = animationController.value;
      });
    });





    animation = ColorTween(begin: Colors.amber, end: Colors.pink).animate(animationController);
    animation2 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(animationController);
    animationMove1 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.1, 0.400, curve: Curves.easeIn,),));
    animationMove2 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.4, 0.700, curve: Curves.easeIn,),));
    animationMove3 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.6, 0.900, curve: Curves.easeIn,),));
    animation3 = CurvedAnimation(parent: animationController,curve: Curves.ease);

    animationOpacity = Tween<double>(begin: 0.0, end: 1.0,).animate(CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.800, curve: Curves.bounceIn,),),);

    animationWidth = Tween<double>(begin: 50.0, end: 150.0,).animate(CurvedAnimation(parent: animationController, curve: Interval(0.125, 0.250, curve: Curves.ease,),),);

    animationHeight = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(parent: animationController, curve: Interval(0.250, 0.375, curve: Curves.ease,),),);

    animationPadding = EdgeInsetsTween(begin: const EdgeInsets.only(bottom: 16.0), end: const EdgeInsets.only(bottom: 75.0),).animate(CurvedAnimation(parent: animationController, curve: Interval(0.250, 0.375, curve: Curves.ease,),),);

    animationBorderRadius = BorderRadiusTween(begin: BorderRadius.circular(4.0), end: BorderRadius.circular(75.0),).animate(CurvedAnimation(parent: animationController, curve: Interval(0.375, 0.500, curve: Curves.ease,),),);

    animationColor1 = ColorTween(begin: Colors.green[100], end: Colors.green[900],).animate(CurvedAnimation(parent: animationController, curve: Interval(0.000, 0.500, curve: Curves.easeInCirc,),),);
    animationColor2 = ColorTween(begin: Colors.red[100], end: Colors.red[900],).animate(CurvedAnimation(parent: animationController, curve: Interval(0.500, 0.999, curve: Curves.easeInCirc,),),);




    animationController.forward();


    new Timer(new Duration(seconds: 2), () {
      animationController.forward();
    });



    animationController.addStatusListener((status) {
      print("Status is : " + status.toString());

      if (status == AnimationStatus.completed) {
        animationController.reverse().orCancel;

      }else if(status == AnimationStatus.dismissed){
        animationController.forward().orCancel;
      }


    });

  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[


//
//
//          Container(
//            alignment: animation2.value,
//            child:
//            Transform.translate(
//              offset: Offset(1.0, -1.0),
//
//              child: Container(
//                child: Center(child: Text("A",style: TextStyle(fontSize: 48),)),
//                alignment: animation2.value,
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width * 0.15,
//                decoration: BoxDecoration(
//                    color: animation.value, shape: BoxShape.circle),
//              ),
//            ),
//
//          ),
//
//
//          Container(
//            alignment: animation2.value,
//            child:
//            Transform.translate(
//              offset: Offset(1.0, -1.0),
//
//              child: Container(
//                child: Center(child: Text("B",style: TextStyle(fontSize: 48),)),
//                alignment: animation2.value,
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width * 0.15,
//                decoration: BoxDecoration(
//                    color: animation.value, shape: BoxShape.circle),
//              ),
//            ),
//
//          ),
//
//          Container(
//            alignment: animation2.value,
//            child:
//            Transform.translate(
//              offset: Offset(1.0, -1.0),
//
//              child: Container(
//                child: Center(child: Text("C",style: TextStyle(fontSize: 48),)),
//                alignment: animation2.value,
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width * 0.15,
//                decoration: BoxDecoration(
//                    color: animation.value, shape: BoxShape.circle),
//              ),
//            ),
//
//          ),
//
//
//
//          Container(
//            alignment: animation2.value,
//            child:
//            Transform.translate(
//              offset: Offset(1.0, -1.0),
//
//              child: Container(
//                child: Center(child: Text("D",style: TextStyle(fontSize: 48),)),
//                alignment: animation2.value,
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width * 0.15,
//                decoration: BoxDecoration(
//                    color: animation.value, shape: BoxShape.circle),
//              ),
//            ),
//
//          ),
//
//
//          Container(
//            alignment: animation2.value,
//            child:
//            Transform.translate(
//              offset: Offset(1.0, -1.0),
//
//              child: Container(
//                child: Center(child: Text("E",style: TextStyle(fontSize: 48),)),
//                alignment: animation2.value,
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width * 0.15,
//                decoration: BoxDecoration(
//                    color: animation.value, shape: BoxShape.circle),
//              ),
//            ),
//
//          ),
//
//
                Container(
                  alignment: animationMove1.value,
                  child:
                  Transform.translate(
                    offset: Offset(1.0, -1.0),

                    child: Container(
                      child: Center(child: Text("1",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove1.value,
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          color: animation.value, shape: BoxShape.circle),
                    ),
                  ),

                ),


                Container(
                  alignment: animationMove2.value,
                  child:
                  Transform.translate(
                    offset: Offset(1.0, -1.0),

                    child: Container(
                      child: Center(child: Text("2",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove2.value,
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          color: animation.value, shape: BoxShape.circle),
                    ),
                  ),

                ),


                Container(
                  alignment: animationMove3.value,
                  child:
                  Transform.translate(
                    offset: Offset(1.0, -1.0),

                    child: Container(
                      child: Center(child: Text("3",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove3.value,
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          color: animation.value, shape: BoxShape.circle),
                    ),
                  ),

                ),



                Container(
//            alignment: animation2.value,
                  child:
                  Transform.rotate(
                    angle: animationController.value * 0,
                    child: Container(
                      child: Center(child: Text("A",style: TextStyle(fontSize: animation3.value*24),)),
                      height: 50.0,
                      width: 50.0,
//                color: animation.value,
                      color: animationColor1.value,

                    ),
                  ),

                ),




                Container(
//            alignment: animation2.value,
                  child:
                  Transform.rotate(
                    angle: animationController.value * 0,
                    child: Container(
                      child: Center(child: Text("B",style: TextStyle(fontSize: animation3.value*24),)),
                      height: 50.0,
                      width: 50.0,
//                color: animation.value,
                      color: animationColor2.value,

                    ),
                  ),

                ),







              ],
            ),
          ),
        ],
      ),
    );
  }
}






//
//
//
//
//// Copyright 2017 The Chromium Authors. All rights reserved.
//// Use of this source code is governed by a BSD-style license that
//// can be found in the LICENSE file.
//
//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart' show timeDilation;
//
//class StaggerAnimation extends StatelessWidget {
//  StaggerAnimation({ Key key, this.controller }) :
//
//  // Each animation defined here transforms its value during the subset
//  // of the controller's duration defined by the animation's interval.
//  // For example the opacity animation transforms its value during
//  // the first 10% of the controller's duration.
//
//        opacity = Tween<double>(begin: 0.0, end: 1.0,).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.800, curve: Curves.bounceIn,),),),
//
//        width = Tween<double>(begin: 50.0, end: 150.0,).animate(CurvedAnimation(parent: controller, curve: Interval(0.125, 0.250, curve: Curves.ease,),),),
//
//        height = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.250, 0.375, curve: Curves.ease,),),),
//
//        padding = EdgeInsetsTween(begin: const EdgeInsets.only(bottom: 16.0), end: const EdgeInsets.only(bottom: 75.0),).animate(CurvedAnimation(parent: controller, curve: Interval(0.250, 0.375, curve: Curves.ease,),),),
//
//        borderRadius = BorderRadiusTween(begin: BorderRadius.circular(4.0), end: BorderRadius.circular(75.0),).animate(CurvedAnimation(parent: controller, curve: Interval(0.375, 0.500, curve: Curves.ease,),),),
//
//        color = ColorTween(begin: Colors.indigo[100], end: Colors.orange[400],).animate(CurvedAnimation(parent: controller, curve: Interval(0.500, 0.750, curve: Curves.ease,),),),
//
//        super(key: key);
//
//  final Animation<double> controller;
//  final Animation<double> opacity;
//  final Animation<double> width;
//  final Animation<double> height;
//  final Animation<EdgeInsets> padding;
//  final Animation<BorderRadius> borderRadius;
//  final Animation<Color> color;
//
//  // This function is called each time the controller "ticks" a new frame.
//  // When it runs, all of the animation's values will have been
//  // updated to reflect the controller's current value.
//  Widget _buildAnimation(BuildContext context, Widget child) {
//    return Container(
//      padding: padding.value,
//      alignment: Alignment.bottomCenter,
//      child: Opacity(
//        opacity: opacity.value,
//        child: Container(
//          width: width.value,
//          height: height.value,
//          decoration: BoxDecoration(
//            color: color.value,
//            border: Border.all(
//              color: Colors.indigo[300],
//              width: 3.0,
//            ),
//            borderRadius: borderRadius.value,
//          ),
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      builder: _buildAnimation,
//      animation: controller,
//    );
//  }
//}
//
//
//
//class StaggerDemo extends StatefulWidget {
//  @override
//  _StaggerDemoState createState() => _StaggerDemoState();
//}
//
//class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin {
//  AnimationController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
//
//
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  Future<void> _playAnimation() async {
//    try {
//      await _controller.forward().orCancel;
//      await _controller.reverse().orCancel;
//    } on TickerCanceled {
//      // the animation got canceled, probably because we were disposed
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    timeDilation = 10.0; // 1.0 is normal animation speed.
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Staggered Animation',),
//      ),
//      body: GestureDetector(
//        behavior: HitTestBehavior.opaque,
//        onTap: () {
//          _playAnimation();
//        },
//        child: Center(
//          child: Container(
//            width: 300.0,
//            height: 300.0,
//            decoration: BoxDecoration(
//              color: Colors.black.withOpacity(0.1),
//              border: Border.all(
//                color:  Colors.black.withOpacity(0.5),
//              ),
//            ),
//            child: StaggerAnimation(
//                controller: _controller.view
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//void main() {
//  runApp(MaterialApp(home: StaggerDemo()));}