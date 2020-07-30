import 'package:flutter/material.dart';
import 'package:test_compilation/render_library/object3d.dart';
import 'package:test_compilation/two_circles/two_circles.dart';
import 'package:test_compilation/zflutter_object/zflutter_object.dart';
import 'package:vector_math/vector_math.dart' hide Colors;
import 'package:zflutter/zflutter.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zflutter/src/widgets/group.dart';
import 'package:zflutter/zflutter.dart';
import 'cloud/cloud.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
//          primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
//home: TwoCircles());
//        home: ZFlutterObject());
        home: ObjectAnimation());
  }
}

class ObjectAnimation extends StatefulWidget {
  @override
  _ObjectAnimationState createState() => _ObjectAnimationState();
}

class _ObjectAnimationState extends State<ObjectAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 20), vsync: this);
    Tween tween = Tween(begin: -1000.0, end: 1000.0);
    animation = tween.animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Invoked');
    double zSheepOpacity = 0.3;
    return Scaffold(
        body: Container(
      color: Colors.orange,
      child: ZIllustration(
        children: [
          AnimatedBuilder(
            child: ZSheep(
                height: 100,
                width: 100,
                depth: 100,
                color: Color(0xffCC2255).withOpacity(zSheepOpacity),
                frontColor: Color(0xffCC2255).withOpacity(zSheepOpacity),
                topColor: Colors.yellow.withOpacity(zSheepOpacity),
                leftColor: Colors.green.withOpacity(zSheepOpacity),
                rightColor: Colors.blue.withOpacity(zSheepOpacity),
                bottomColor: Colors.orange.withOpacity(zSheepOpacity),
                rearColor: Colors.red.withOpacity(zSheepOpacity)),
            builder: (context, child) {
              return ZPositioned(
                  translate: ZVector.only(y: animation.value), child: child);
            },
            animation: animationController,
          ),
        ],
      ),
    ));
    return Scaffold(
        body: Container(
      color: Colors.orange,
      child: AnimatedBuilder(
        builder: (context, snapshot) {
          return Object3D(
              zoom: 2,
              path: 'assets/obj/spaceship.obj',
              rotate: Vector3(0, 0, 0),
              translate: Vector3(400, animation.value, 0));
        },
        animation: animationController,
      ),
    ));
  }
}

class ZSheep extends StatelessWidget {
  final double width;
  final double height;
  final double depth;

  final double stroke;
  final bool fill;

  final Color color;
  final bool visible;

  final Color frontColor;
  final Color rearColor;
  final Color leftColor;
  final Color rightColor;
  final Color topColor;
  final Color bottomColor;

  ZSheep({
    this.width,
    this.height,
    this.depth,
    this.stroke = 1,
    this.fill = true,
    this.color,
    this.visible,
    this.frontColor,
    this.rearColor,
    this.leftColor,
    this.rightColor,
    this.topColor,
    this.bottomColor,
  });

  Widget get frontFace => ZPositioned(
        translate: ZVector.only(z: depth / 2),
        child: ZRect(
          color: frontColor ?? color,
          fill: fill,
          stroke: 1,
          width: width,
          height: height,
        ),
      );

  Widget get rearFace => ZPositioned(
        translate: ZVector.only(z: -depth / 2),
        rotate: ZVector.only(y: tau / 2),
        child: ZRect(
          width: width,
          height: height,
          color: rearColor ?? color,
          fill: fill,
          stroke: 1,
        ),
      );

  Widget get leftFace => ZPositioned(
        translate: ZVector.only(x: -width / 2),
        rotate: ZVector.only(y: -tau / 4),
        child: ZRect(
          width: depth,
          height: height,
          stroke: 1,
          color: leftColor ?? color,
          fill: fill,
        ),
      );

  Widget get rightFace => ZPositioned(
        translate: ZVector.only(x: width / 2),
        rotate: ZVector.only(y: tau / 4),
        child: ZRect(
          width: depth,
          color: rightColor ?? color,
          height: height,
          stroke: 1,
          fill: fill,
        ),
      );

  Widget get topFace => ZPositioned(
        translate: ZVector.only(y: -height / 2),
        rotate: ZVector.only(x: -tau / 4),
        child: ZRect(
          width: width,
          color: topColor ?? color,
          height: depth,
          stroke: 1,
          fill: fill,
        ),
      );

  Widget get bottomFace => ZPositioned(
        translate: ZVector.only(y: height / 2),
        rotate: ZVector.only(x: tau / 4),
        child: ZRect(
          width: width,
          color: bottomColor ?? color,
          stroke: 1,
          fill: fill,
          height: depth,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ZGroup(
      children: [
        frontFace,
        rearFace,
        leftFace,
        rightFace,
        topFace,
        bottomFace,
      ],
    );
  }
}
