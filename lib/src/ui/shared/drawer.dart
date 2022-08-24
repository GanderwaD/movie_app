import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/constants/app_path.dart';
import 'package:movie_app/src/router/router_helper.dart';
import 'package:movie_app/src/ui/drawers/all_movies.dart';
import 'package:movie_app/src/widgets/buttons/drawer_button.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';
import 'package:movie_app/src/widgets/theme/colors.dart';


class GetDrawer extends ConsumerWidget {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      child: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: glaucous,
                  child: DrawerButton(
                    onPressed: () => R.instance.add(object: AllMovies()),
                    text: TextWidget("All Movies"),
                    icon: Image.asset(
                      APath.iconLogo(),
                    ),
                    endingIcon: const Icon(Icons.arrow_forward_ios,
                        size: 20.0, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10),
                DrawerButton(
                  onPressed: null,
                  text: TextWidget("Drawer 1"),
                  icon: Image.asset(
                    APath.iconLogo(),
                  ),
                  endingIcon: const Icon(Icons.arrow_forward_ios,
                      size: 20.0, color: Colors.grey),
                ),
                SizedBox(height: 10),
                DrawerButton(
                  onPressed: null,
                  text: TextWidget("Drawer 2"),
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
      ),
    );
  }
}
