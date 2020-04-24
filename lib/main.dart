import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_positioned/widgets/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Bingo Demo'),
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
  Animation animationMove4;
  Animation animationMove5;
  Animation animationMove6;
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
    _runBalls();

  }

  void _runBalls(){
    animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);

    animationController.addListener(() {
      setState(() {
        _angle1 = animationController.value;
      });
    });


    animation = ColorTween(begin: Colors.amber, end: Colors.pink).animate(animationController);
    animation2 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(animationController);
    animationMove1 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.1, 0.900, curve: Curves.easeIn,),));
    animationMove2 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.3, 0.900, curve: Curves.easeIn,),));
    animationMove3 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.4, 0.900, curve: Curves.easeIn,),));
    animationMove4 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 0.900, curve: Curves.easeIn,),));
    animationMove5 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.7, 0.900, curve: Curves.easeIn,),));
    animationMove6 = AlignmentTween(begin: Alignment(-1,-1),end: Alignment(-1,1)).animate(CurvedAnimation(parent: animationController, curve: Interval(0.8, 0.900, curve: Curves.easeIn,),));
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
//        animationController.reverse().orCancel;

      }else if(status == AnimationStatus.dismissed){
//        animationController.forward().orCancel;
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
      body: Stack(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
      children: <Widget>[
      Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

            // 1 Ball
//          Container(
//            alignment: animationMove1.value,
//            child:
//            Transform.translate(
//              offset: Offset(1.0, -1.0),
//
//              child: Container(
//                child: Center(child: Text("1",style: TextStyle(fontSize: 48),)),
//                alignment: animationMove1.value,
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width * 0.15,
//                decoration: BoxDecoration(
//                    color: animation.value, shape: BoxShape.circle),
//              ),
//            ),
//
//          ),
            Container(
              alignment: animationMove1.value,
              child:
              Transform.translate(
                offset: Offset(1.0, -1.0),

                child: Transform.rotate(
                  angle: animationController.value * 60,
                  child: Container(

                      child: Center(child: Text(" ",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove3.value,
                      height: 50,
//                  height: MediaQuery.of(context).size.height * 0.15,
                      width: 50,
//                  width: MediaQuery.of(context).size.width * 0.15,
//                  decoration: BoxDecoration(
//                      color: animation.value, shape: BoxShape.circle),

                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bingo_ball_90.png'),
                          fit: BoxFit.cover,
                        ),
                      )


                  ),
                ),
              ),

            ),



            // 2 Ball
//          Container(
//            alignment: animationMove2.value,
//            child:
//            Transform.translate(
//              offset: Offset(1.0, -1.0),
//
//              child: Container(
//                child: Center(child: Text("2",style: TextStyle(fontSize: 48),)),
//                alignment: animationMove2.value,
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width * 0.15,
//                decoration: BoxDecoration(
//                    color: animation.value, shape: BoxShape.circle),
//              ),
//            ),
//
//          ),
            Container(
              alignment: animationMove2.value,
              child:
              Transform.translate(
                offset: Offset(1.0, -1.0),

                child: Transform.rotate(
                  angle: animationController.value * 45,
                  child: Container(

                      child: Center(child: Text(" ",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove3.value,
                      height: 50,
//                  height: MediaQuery.of(context).size.height * 0.15,
                      width: 50,
//                  width: MediaQuery.of(context).size.width * 0.15,
//                  decoration: BoxDecoration(
//                      color: animation.value, shape: BoxShape.circle),

                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bingo_ball_90.png'),
                          fit: BoxFit.cover,
                        ),
                      )


                  ),
                ),
              ),

            ),


            // 3 Ball
            Container(
              alignment: animationMove3.value,
              child:
              Transform.translate(
                offset: Offset(1.0, -1.0),

                child: Transform.rotate(
                  angle: animationController.value * 30,
                  child: Container(

                    child: Center(child: Text(" ",style: TextStyle(fontSize: 48),)),
                    alignment: animationMove3.value,
                    height: 50,
//                  height: MediaQuery.of(context).size.height * 0.15,
                    width: 50,
//                  width: MediaQuery.of(context).size.width * 0.15,
//                  decoration: BoxDecoration(
//                      color: animation.value, shape: BoxShape.circle),

                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bingo_ball_90.png'),
                          fit: BoxFit.cover,
                        ),
                      )


                  ),
                ),
              ),

            ),




            // 4 Ball
            Container(
              alignment: animationMove4.value,
              child:
              Transform.translate(
                offset: Offset(1.0, -1.0),

                child: Transform.rotate(
                  angle: animationController.value * 50,
                  child: Container(

                      child: Center(child: Text("",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove3.value,
                      height: 50,
//                  height: MediaQuery.of(context).size.height * 0.15,
                      width: 50,
//                  width: MediaQuery.of(context).size.width * 0.15,
//                  decoration: BoxDecoration(
//                      color: animation.value, shape: BoxShape.circle),

                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bingo_ball_90.png'),
                          fit: BoxFit.cover,
                        ),
                      )


                  ),
                ),
              ),

            ),



            // 5 Ball
            Container(
              alignment: animationMove5.value,
              child:
              Transform.translate(
                offset: Offset(1.0, -1.0),

                child: Transform.rotate(
                  angle: animationController.value * 10,
                  child: Container(

                      child: Center(child: Text("",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove3.value,
                      height: 50,
//                  height: MediaQuery.of(context).size.height * 0.15,
                      width: 50,
//                  width: MediaQuery.of(context).size.width * 0.15,
//                  decoration: BoxDecoration(
//                      color: animation.value, shape: BoxShape.circle),

                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bingo_ball_90.png'),
                          fit: BoxFit.cover,
                        ),
                      )


                  ),
                ),
              ),

            ),


            // 6 Ball
            Container(
              alignment: animationMove6.value,
              child:
              Transform.translate(
                offset: Offset(1.0, -1.0),

                child: Transform.rotate(
                  angle: animationController.value * 70,
                  child: Container(

                      child: Center(child: Text("",style: TextStyle(fontSize: 48),)),
                      alignment: animationMove3.value,
                      height: 50,
//                  height: MediaQuery.of(context).size.height * 0.15,
                      width: 50,
//                  width: MediaQuery.of(context).size.width * 0.15,
//                  decoration: BoxDecoration(
//                      color: animation.value, shape: BoxShape.circle),

                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bingo_ball_90.png'),
                          fit: BoxFit.cover,
                        ),
                      )


                  ),
                ),
              ),

            ),



            // Square 1
//          Container(
////            alignment: animation2.value,
//            child:
//            Transform.rotate(
//              angle: animationController.value * 0,
//              child: Container(
//                child: Center(child: Text("A",style: TextStyle(fontSize: animation3.value*24),)),
//                height: 50.0,
//                width: 50.0,
////                color: animation.value,
//                color: animationColor1.value,
//
//              ),
//            ),
//
//          ),

            // Square 2
//          Container(
////            alignment: animation2.value,
//            child:
//            Transform.rotate(
//              angle: animationController.value * 1,
//              child: Container(
//                child: Center(child: Text("B",style: TextStyle(fontSize: animation3.value*24),)),
//                height: 50.0,
//                width: 50.0,
////                color: animation.value,
//                color: animationColor2.value,
//
//              ),
//            ),
//
//          ),



        ],
      ),
    ),
    ],
    ),
          ),

          Column(
        children: <Widget>[


          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: CurvePainter(),
            ),
//              color: Colors.blueAccent,
          )

        ],
      ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
//                  height: MediaQuery.of(context).size.height,
//                  width: MediaQuery.of(context).size.width,
                    child:

//                    RaisedButton(onPressed: (){
//                      _runBalls();
//                    },child: Text("Roll One More Time"),),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child:Text("Roll One More Time", style: TextStyle(fontSize: 24),),
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(

                        borderRadius: new BorderRadius.circular(30.0)),
                        padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 20.0, left: 20.0),
                        onPressed: () {
                          _runBalls();
                        }




        ),
                      ),
              ),)

      ],
    ),

        ],
      ),
    );
  }
}