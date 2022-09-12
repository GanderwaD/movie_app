import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/bubble_indicator_painter.dart';
import '../shared/widgets/bases/base_scaffold.dart';
import '../shared/widgets/text_widget/text_size.dart';
import '../shared/widgets/text_widget/text_widget.dart';
import '../shared/widgets/theme/colors.dart';
import 'account_view_controller.dart';
import 'login/sign_in.dart';
import 'register/sign_up.dart';

class AccountView extends ConsumerWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(accountViewProvider);
    return BaseScaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: deepMetalGradient,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 75.0),
                  child: TextWidget(
                    "MovieApp",
                    color: brushedSilver,
                    fontFamily: 'FoxCavalier',
                    textSize: TextSize.xxlLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(context, controller),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: controller.accountController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) =>
                        controller.onPageChanged(i, context),
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const SignIn(),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const SignUp(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context, AccountViewController controller) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(
            pageController: controller.accountController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () => controller.onSignInButtonPress(),
                child: Text(
                  'LogIn',
                  style: TextStyle(
                      color: controller.left,
                      fontSize: 16.0,
                      fontFamily: 'SanFrancisco'),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () => controller.onSignUpButtonPress(),
                child: Text(
                  'SignUp',
                  style: TextStyle(
                      color: controller.right,
                      fontSize: 16.0,
                      fontFamily: 'SanFrancisco'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
