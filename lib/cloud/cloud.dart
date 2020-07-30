import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class Cloud extends StatefulWidget {
  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  @override
  Widget build(BuildContext context) {
    final Gradient gradient = RadialGradient(colors: <Color>[
      Colors.tealAccent.withOpacity(1.0),
      Colors.deepPurple.withOpacity(.0)
    ], stops: [
      0.0,
      1
    ]);
    Rect rect = Rect.fromCircle(center: Offset(0, 0), radius: 100);
    Shader shader = gradient.createShader(rect);
    return Scaffold(
        backgroundColor: Colors.black54,
        body: ZDragDetector(
            builder: (BuildContext context, ZDragController controller) {
          return ZIllustration(children: [
            ZPositioned(
              rotate: controller.rotate,
              child: ZGroup(
                children: [
//                  ZPositioned(
//                      translate: ZVector.only(x: 0, y: 0, z: -1),
//                      child: ZShape(
//                          path: [
//                            ZMove.only(x: -300, y: -100),
//                            ZLine.only(x: 300, y: -100),
//                            ZLine.only(x: 300, y: 100),
//                            ZLine.only(x: -300, y: 100)
//                          ],
//                          closed: true,
//                          stroke: 0,
//                          fill: true,
//                          color: Colors.deepOrange,
//                          shader: shader)),
                  ZPositioned(
//                  rotate: controller.rotate,
                      translate: ZVector.only(x: 0, y: 0, z: -2),
                      child: ZToBoxAdapter(
                          width: 230,
                          height: 230,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.asset(
                                  'assets/gif/cloud_background.gif')))),
                  ZPositioned(
//                  rotate: controller.rotate,
                      translate: ZVector.only(x: 20, y: 0, z: 0),
                      child: ZToBoxAdapter(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/smoke.png'))),
                  ZPositioned(
                      rotate: ZVector.only(z: -20),
                      translate: ZVector.only(x: -30, y: 0, z: 2),
                      child: ZToBoxAdapter(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/smoke.png'))),
                  ZPositioned(
                      rotate: ZVector.only(z: 20),
                      translate: ZVector.only(x: 30, y: 50, z: 4),
                      child: ZToBoxAdapter(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/smoke.png'))),
                  ZPositioned(
                      rotate: ZVector.only(z: 40),
                      translate: ZVector.only(x: 20, y: 50, z: 6),
                      child: ZToBoxAdapter(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/smoke.png'))),
                  ZPositioned(
                      rotate: ZVector.only(z: 20),
                      translate: ZVector.only(x: -30, y: -50, z: 8),
                      child: ZToBoxAdapter(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/smoke.png'))),
                  ZPositioned(
                      rotate: ZVector.only(z: 20),
                      translate: ZVector.only(x: 50, y: -20, z: 10),
                      child: ZToBoxAdapter(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/smoke.png'))),
                  ZPositioned(
                      rotate: ZVector.only(z: 5.3),
                      translate: ZVector.only(x: -40, y: 30, z: 12),
                      child: ZToBoxAdapter(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/smoke.png'))),
                ],
              ),
            )
//            ZPositioned(
//                rotate: controller.rotate,
//                translate: ZVector.only(x: 40, y: -30),
//                child: ZToBoxAdapter(
//                    width: 350,
//                    height: 350,
//                    child: Image.asset('assets/smoke.png')))
          ]);
        }));
  }
}
