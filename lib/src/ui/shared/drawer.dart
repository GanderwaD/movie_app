import 'package:flutter/material.dart';
import 'package:movie_app/src/constants/app_path.dart';
import 'package:movie_app/src/widgets/buttons/drawer_button.dart';

class GetDrawer extends StatelessWidget {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerButton(
                  onPressed: null,
                  text: 'First Drawer Button',
                  icon: Image.asset(
                    APath.iconLogo(),
                  ),
                  endingIcon: const Icon(Icons.arrow_forward_ios,
                      size: 20.0, color: Colors.grey),
                ),
                SizedBox(height: 10),
                DrawerButton(
                  onPressed: null,
                  text: 'Second Drawer Button',
                  icon: Image.asset(
                    APath.iconLogo(),
                  ),
                  endingIcon: const Icon(Icons.arrow_forward_ios,
                      size: 20.0, color: Colors.grey),
                ),
                SizedBox(height: 10),
                DrawerButton(
                  onPressed: null,
                  text: 'Third Drawer Button',
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
