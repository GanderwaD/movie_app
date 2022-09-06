import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/account/login_page.dart';

import '../../constants/app_path.dart';
import '../../router/router_helper.dart';
import '../discover_movies/discover_movies.dart';
import 'buttons/drawer_button.dart';
import 'text_widget/text_widget.dart';
import 'theme/colors.dart';

class GetDrawer extends ConsumerWidget {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: glaucous,
                child: DrawerButton(
                  onPressed: () => R.instance.add(object: const LoginPage()),
                  text: const TextWidget("Login"),
                  icon: Image.asset(
                    APath.iconLogo(),
                  ),
                  endingIcon: const Icon(Icons.arrow_forward_ios,
                      size: 20.0, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              DrawerButton(
                onPressed: null,
                text: const TextWidget("Sign Up"),
                icon: Image.asset(
                  APath.iconLogo(),
                ),
                endingIcon: const Icon(Icons.arrow_forward_ios,
                    size: 20.0, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              DrawerButton(
                onPressed: null,
                text: const TextWidget("Drawer 2"),
                icon: Image.asset(
                  APath.iconLogo(),
                ),
                endingIcon: const Icon(Icons.arrow_forward_ios,
                    size: 20.0, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
