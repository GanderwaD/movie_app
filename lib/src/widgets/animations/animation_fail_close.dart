

// import 'package:flutter/material.dart';
// import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
// import 'package:vector_math/vector_math_64.dart' as math;

// import '../shared/ui_color.dart';
// /*
//  * ---------------------------
//  * Project : Fan Support Mobile
//  * File : animation_fail_close.dart
//  * Status : created
//  * ---------------------------
//  * Author : nesmin
//  * Date : Tue Sep 07 2021 1:55:23 PM
//  * Copyright (c) 2021 
//  * ---------------------------
//  */

// class AnimationFailClose extends StatefulWidget {
//   const AnimationFailClose({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _AnimationFailCloseState();
//   }
// }

// class _AnimationFailCloseState extends State<AnimationFailClose>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;

//   late SequenceAnimation sequenceAnimation;

//   @override
//   void initState() {
    
//     animationController = AnimationController(vsync: this);

//     sequenceAnimation = SequenceAnimationBuilder()
//         .addAnimatable(
//             animatable: Tween(begin: 90.0, end: 0.0),
//             from: const Duration(milliseconds: 0),
//             to: const Duration(milliseconds: 300),
//             tag: "rotation")
//         .addAnimatable(
//             animatable: Tween(begin: 0.3, end: 1.0),
//             from: const Duration(milliseconds: 600),
//             to: const Duration(milliseconds: 900),
//             tag: "fade",
//             curve: Curves.bounceOut)
//         .addAnimatable(
//             animatable: Tween(begin: 32.0 / 5.0, end: 32.0 / 2.0),
//             from: const Duration(milliseconds: 600),
//             to: const Duration(milliseconds: 900),
//             tag: "fact",
//             curve: Curves.bounceOut)
//         .animate(animationController);

//     //delay
//     Future.delayed(const Duration(milliseconds: 200)).then((_) {
//       forward();
//     });

//     super.initState();
//   }

//   void forward() {
//     animationController
//         .animateTo(1.0,
//             duration: const Duration(milliseconds: 600), curve: Curves.ease)
//         .then((_) {});
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: animationController,
//         builder: (c, w) {
//           return Transform(
//             transform: Matrix4.rotationX(
//                 math.radians(sequenceAnimation['rotation'].value)),
//             origin: const Offset(0.0, 32.0),
//             child: CustomPaint(
//               painter: _CustomPainter(
//                   color: UIColor.danger,
//                   fade: sequenceAnimation['fade'].value,
//                   factor: sequenceAnimation['fact'].value),
//             ),
//           );
//         });
//   }
// }

// class _CustomPainter extends CustomPainter {
//   final Paint _paint = Paint();

//   late Color color;

//   final double _r = 32.0;
//   late final double fade;
//   late final double factor;

//   _CustomPainter({required this.color, required this.fade, required this.factor}) {
//     _paint.strokeCap = StrokeCap.round;
//     _paint.style = PaintingStyle.stroke;
//     _paint.strokeWidth = 4.0;
//     _paint.color = color;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//     _paint.color = color;

//     path.addArc(Rect.fromCircle(center: Offset(_r, _r), radius: _r),
//         0.0, math.radians(360.0));
//     canvas.drawPath(path, _paint);

//     path = Path();
//     //fade
//     _paint.color =
//         Color(color.value & 0x00FFFFFF + ((0xff * fade).toInt() << 24));

//     path.moveTo(_r - factor, _r - factor);
//     path.lineTo(_r + factor, _r + factor);

//     path.moveTo(_r + factor, _r - factor);
//     path.lineTo(_r - factor, _r + factor);
//     canvas.drawPath(path, _paint);
//   }

//   @override
//   bool shouldRepaint(_CustomPainter oldDelegate) {
//     return color != oldDelegate.color || fade != oldDelegate.fade;
//   }
// }
