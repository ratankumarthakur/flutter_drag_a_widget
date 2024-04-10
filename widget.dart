import 'package:flutter/material.dart';

class widget1 extends StatefulWidget {
  const widget1({super.key});

  @override
  State<widget1> createState() => _widget1State();
}

class _widget1State extends State<widget1> {

  Color caughtColor=Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Draggable(
            data: Colors.orange,
              child: Container(
                width: 100,height: 100,color: Colors.orange,
                  child: const Center(
                      child: Text("Box"))),
            onDraggableCanceled: (velocity,offset){},
            feedback: Container(
              width: 150,height: 150,color: Colors.orange.withOpacity(.5),
              child: const Center(
                child: Text(
                  "Box"
                ),
              ),
            ),
          ),
          DragTarget(
            onAccept: (Color color){
              caughtColor=color;
            },
            builder:( BuildContext context,
            List<dynamic> accepted,
              List<dynamic> rejected,
          ) {
              return Container(
                width: 200,height: 200,
                  color: accepted.isEmpty? caughtColor:Colors.grey.shade200,
                child: const Center(
                  child: Text(
                    "Drag here"
                  ),
                ),
              );
            },),
        ],
      )
    );
  }
}
