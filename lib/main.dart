import 'package:flutter/material.dart';
import 'package:test_compilation/render_library/object3d.dart';
import 'package:test_compilation/two_circles/two_circles.dart';
import 'package:test_compilation/zflutter_object/zflutter_object.dart';
import 'package:vector_math/vector_math.dart';
import 'package:zflutter/zflutter.dart';

import 'cloud/cloud.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
//          primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
//home: TwoCircles());
//        home: ZFlutterObject());
        home: Object3D(
            zoom: 1,
            path: 'assets/obj/spaceship.obj',
            rotate: Vector3(0, 0, 0),
            translate: Vector3(0, 0, 0)));
  }
}
