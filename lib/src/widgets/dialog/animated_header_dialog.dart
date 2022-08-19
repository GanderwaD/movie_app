
//   static import 'package:flutter/material.dart';
// import 'package:follow_me/src/ui/widgets/text_widget/text_size.dart';

// import '../text_widget/text_widget.dart';

// Widget animatedHeaderDialog({Animations? type, String? title}) {
//     return Column(
//       children: [
//         SizedBox(
//           width: 64.0,
//           height: 64.0,
//           child: getAnimationWidget(type ?? Animations.Success),
//         ),
//         const SizedBox(height: 20.0),
//         TextWidget(
//           title ?? '',
//           textAlign: TextAlign.center,
//           fontWeight: FontWeight.bold,
//           textSize: TextSize.large,
//         ),
//       ],
//     );
//   }

//   static getAnimationWidget(Animations type) {
//     switch (type) {
//       case Animations.Success:
//         return const AnimationSuccesCheck();
//       case Animations.Fail:
//         return const AnimationFailClose();
//       default:
//     }
//   }