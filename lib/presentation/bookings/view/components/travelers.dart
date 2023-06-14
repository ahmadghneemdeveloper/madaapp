// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }
//
// class _MyCustomWidgetState extends State<MyCustomWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     _controller = AnimationController(
//         value: 0.0,
//         duration: const Duration(milliseconds: 500),
//         reverseDuration: const Duration(milliseconds: 250),
//         vsync: this)
//       ..addStatusListener((status) {
//         setState(() {});
//       });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   bool get _BlahBlah {
//     switch (_controller.status) {
//       case AnimationStatus.forward:
//       case AnimationStatus.completed:
//         return true;
//       case AnimationStatus.reverse:
//       case AnimationStatus.dismissed:
//         return false;
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return FadeScaleTransition(
//                     animation: _controller, child: child);
//               },
//               child: Container(
//                 height: 200,
//                 width: 200,
//                 color: Colors.deepPurpleAccent,
//               ),
//             ),
//             InkWell(
//               splashColor: Colors.red,
//               highlightColor: Colors.blue,
//               onTap: () {
//                 if (_BlahBlah) {
//                   _controller.reverse();
//                 } else {
//                   _controller.forward();
//                 }
//               },
//               child: Container(
//                 height: 55,
//                 width: 120,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       blurRadius: 20,
//                     )
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     _BlahBlah ? 'HIDE' : 'SHOW',
//                     style: TextStyle(color: Colors.black, fontSize: 17),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }