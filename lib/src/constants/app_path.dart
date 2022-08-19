/*
 * ---------------------------
 * File : app_path.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Mon Feb 21 2022 12:01:41 AM
 * Copyright (c) 2022
 * ---------------------------
 */

class APath {
  static bool get isLight => true; //for now

  ///icons
  static String iconPath = 'assets/icon/';
  static String lightIconPath = 'assets/icon/light/';
  static String darkIconPath = 'assets/icon/dark/';


  // icons theme based
  static String iconLogo({bool? useDark = false}) {
    useDark = useDark ?? isLight;
    return '${useDark ? darkIconPath : lightIconPath}logo.png';
  }

  ///images
  static String imgPath = 'assets/images/';

}
