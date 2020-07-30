import 'package:flutter/material.dart';
import 'package:test_compilation/render_library/object3d.dart';
import 'package:vector_math/vector_math.dart';
import 'package:zflutter/zflutter.dart';

class ZFlutterObject extends StatefulWidget {
  @override
  _ZFlutterObjectState createState() => _ZFlutterObjectState();
}

class _ZFlutterObjectState extends State<ZFlutterObject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ZDragDetector(
        builder: (BuildContext context, ZDragController controller) {
      return ZIllustration(children: [
        ZToBoxAdapter(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(color: Color.fromRGBO(24, 53, 64, 1))),
        ZPositioned(
            rotate: controller.rotate,
            child: ZToBoxAdapter(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Object3D(
                    zoom: 1,
                    path: 'assets/obj/spaceship.obj',
                    rotate: Vector3(10, 20, 30),
                    translate: Vector3(50, 50, 60))))
      ]);
    }));
  }
}
