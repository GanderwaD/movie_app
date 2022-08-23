import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';

class ProfileView extends ConsumerWidget with RouterObject {
  const ProfileView({Key? key}) : super(key: key);

  @override
  String get routeKey => profileKey;
  
  @override
  String get routePath => profilePath;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return const Center(child:Text('ProfileView'));
  }
}