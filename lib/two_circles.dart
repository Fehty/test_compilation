import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import 'package:vertex/vertex.dart';
import 'package:zflutter/zflutter.dart';

class TwoCircles extends StatefulWidget {
  @override
  _TwoCirclesState createState() => _TwoCirclesState();
}

class _TwoCirclesState extends State<TwoCircles> with TickerProviderStateMixin {
  AnimationController circleController;
  Animation tween;

  VertexDefaultController vertexController;

  @override
  initState() {
    // After 150 visibility = 0
    ZVector.zVisible = 150;
    ZVector.zNotVisible = -150;
    // 150 - (1 - 0.4) visibility = 1; after is decreasing
    ZVector.zVisibleX = 0.1;
    //Must be absolute
    ZVector.zStartAnimValueAbs = (-200.0).abs();

    circleController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    tween = Tween<double>(begin: -200, end: 200).animate(circleController);

//    vertexController = RandomVertexController(context, [
//      ObjPath("spaceship", "assets/obj", "spaceship.obj")
//    ], [
//      InstanceInfo("spaceship",
//          position: Vector3(0, 0, 0),
//          scale: Vector3(1, 1, 1),
//          rotation: Quaternion(0, 0, 0, 0)),
//    ]);

    vertexController = VertexDefaultController(context, [
      ObjPath("spaceship", "assets/obj", "spaceship.obj")
    ], [
      InstanceInfo("spaceship",
          position: Vector3(0, 0, 0),
          scale: Vector3(1, 1, 1),
          rotation: Quaternion(0, 0, 0, 0)),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!vertexController.isReady) {
      vertexController.init();
    }

//    return Scaffold(
//      body: Center(
//        child: ListenableBuilder(
//          listenable: vertexController,
//          builder: (context) {
//            if (vertexController.isReady)
//              return SceneRenderer(vertexController.meshInstances);
//            return Center(child: CircularProgressIndicator());
//          },
//        ),
//      ),
//    );
    return Scaffold(
        appBar: AppBar(title: Text('Two circles')),
        body: AnimatedBuilder(
            animation: circleController,
            builder: (context, _) {
//              print(tween.value);
              return ZDragDetector(
                  builder: (BuildContext context, ZDragController controller) {
                    return ZIllustration(children: [
                      ZToBoxAdapter(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Container(color: Color(0xFFCC2255))),
                      ZPositioned(
                          rotate: controller.rotate,
                          child: ZGroup(children: [
                            ZPositioned(
                                scale: ZVector.getScale((tween.value as double)),
                                translate: ZVector(0, 0, tween.value),
                                child: ZCircle(
                                    fill: true,
                                    diameter: 80,
                                    stroke: 1,
                                    color: Color(0xFFCC2255).withOpacity(
                                        ZVector.opacityValue(tween.value)))),
                            ZPositioned(
                              translate: ZVector.all(0),
                              child: ZToBoxAdapter(
                                width: 200,
                                height: 200,
                                child: ListenableBuilder(
                                  listenable: controller,
                                  builder: (context) {
                                    if (vertexController.isReady)
                                      return SceneRenderer(
                                          vertexController.meshInstances);
                                    return Center(
                                        child: CircularProgressIndicator());
                                  },
                                ),
                              ),
                            )
//                        ListenableBuilder(
//                            listenable: controller,
//                            builder: (context) {
//                              return SceneRenderer(controller.value);
//                            })
//                        ZPositioned(
//                            scale: ZVector.getScale(0),
//                            translate: ZVector(100, 0, 0),
//                            child: ZCircle(
//                                diameter: 80, stroke: 1, color: Colors.grey))
                          ]))
                    ]);
                  });
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (circleController.status == AnimationStatus.completed)
                circleController.reverse();
              else
                circleController.forward();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add)));
  }
}
