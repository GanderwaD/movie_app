/*
 * ---------------------------
 * File : landing_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/landing_page/landing_item_card.dart';
import 'package:movie_app/src/widgets/animations/slide_transform/cube_transform.dart';
import 'package:movie_app/src/widgets/buttons/outline_button_widget.dart';
import 'package:movie_app/src/widgets/page/page_indicator.dart';
import 'package:movie_app/src/widgets/text_widget/text_size.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../widgets/page/page_slider.dart';
import '../shared/base_scaffold.dart';
import '../shared/widget_key_constants.dart';
import 'landing_controller.dart';

class LandingView extends ConsumerWidget with RouterObject {
  const LandingView({super.key});

  @override
  String get routeKey => landingKey;

  @override
  String get routePath => landingPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final landingController = ref.watch(landingProvider);
    final size = MediaQuery.of(context).size;
    return BaseScaffold(
      key: wKeyLandingView,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          PageSlider(
            controller: landingController.landingSliderController,
            onPageChanged: (index) => landingController.updatePageIndex(index),
            enableAutoSlider: landingController.isAutoPlay,
            slideTransform: const CubeTransform(),
            pageBuilder: (index) {
              return LandingItemCard(
                  item: landingController.landingItems[index]);
            },
            itemCount: landingController.landingItems.length,
          ),
          const SizedBox(
            height: 10,
          ),
          PageIndicator(
            count: landingController.landingItems.length,
            currentIndex: landingController.currentLandingPageIndex,
          ),
          if (landingController.currentLandingPageIndex !=
              landingController.landingItems.length - 1)
            const SizedBox(height: 50),
          const SizedBox(height: 10),
          Visibility(
            visible: (landingController.currentLandingPageIndex ==
                landingController.landingItems.length - 1),
            child: OutlineButtonWidget(
              onPressed: ()=> landingController.btnContinue(),
              width: size.width / 2,
              height: 50,
              textPadding: const EdgeInsets.symmetric(horizontal: 20),
              text: 'Continue',
              textColor: Colors.blue,
              fontWeight: FontWeight.bold,
              textSize: TextSize.uLarge,
              borderSide: const BorderSide(
                width: 2.0,
                color: Colors.red,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              width: size.width,
              child: Row(
                children: [
                  TextWidget(
                    "${landingController.currentLandingPageIndex + 1} / ${landingController.landingItems.length}",
                    textSize: TextSize.xxLarge,
                    textAlign: TextAlign.center,
                    color: Colors.black,
                  ),
                  const Spacer(),
                  Visibility(
                    visible: landingController.currentLandingPageIndex !=
                        landingController.landingItems.length - 1,
                    child: InkWell(
                      onTap: () => landingController.skipLast(),
                      child: Row(
                        children: const [
                          TextWidget(
                            "Skip",
                            color: Colors.black,
                            textSize: TextSize.xxLarge,
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
