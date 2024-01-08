import 'package:flutter/material.dart';

class ZoomApp extends StatefulWidget {
  const ZoomApp({super.key});

  @override
  State<ZoomApp> createState() => ZoomAppState();
}

class ZoomAppState extends State<ZoomApp> {
  TransformationController controller=TransformationController();
  bool iszoomed=false;
  zoomin(){
    controller.value=Matrix4.identity()..scale(4.0);
  }
  zoomout(){
    controller.value=Matrix4.identity();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 230, 158, 15),
            Color.fromRGBO(250, 54, 54, 1)
          ])),
        ),
        centerTitle: true,
        title: const Text(
          'Zoom App',
          style: TextStyle(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onLongPress: () {
              controller.value+=Matrix4.identity()..scale(3.0);
            },
            onDoubleTap: () {
             iszoomed?zoomin():zoomout();
             iszoomed=!iszoomed;
            },
            child: InteractiveViewer(
              transformationController: controller,
              minScale: 0.8,maxScale: 8,
              boundaryMargin: EdgeInsets.all(10),
              scaleEnabled: true,
              panEnabled: true,
              // alignment: Alignment.center,
              // panAxis: PanAxis.vertical,
              // onInteractionEnd: (details) {
              //   controller.value=Matrix4.identity();
              // },
              child: Image.asset(
                'assets/Ram.jpg',
                width: 300,
                height: 500,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
