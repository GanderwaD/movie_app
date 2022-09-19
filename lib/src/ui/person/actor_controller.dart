/*
 * ---------------------------
 * File : movie_details_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/person_model.dart';
import 'package:movie_app/src/ui/shared/widgets/paginated_list/paginated_list.dart';

import '../../router/router_helper.dart';
import 'actor_detail_service.dart';

final actorDetailsProvider =
    ChangeNotifierProvider.family<ActorDetailsController, int>((ref, movieId) {
  var actorDetailService = ref.read(actorDetailServiceProvider);
  return ActorDetailsController(
    movieId,
    actorDetailService,
  );
});

class ActorDetailsController extends ChangeNotifier {
  ActorDetailsController(this.movieId, this._service) {
    init();
  }
  final int movieId;
  final ActorDetailService _service;
  PaginatedController actorDetailsPaginatedController = PaginatedController();
  ScrollController actorDetailsScrollController = ScrollController();
  ActorDetail actorDetail = ActorDetail();
  bool isDetailsLoading = false;
  bool isRefresh = false;

  init() async {
    await getActorDetails();
  }

  Future getActorDetails() async {
    actorDetail = await _service.getActorDetail(movieId);
    notifyListeners();
  }

  goBack(context) {
    R.instance.popWidget(context);
  }

  setDetailsLoading(bool val) {
    isDetailsLoading = val;
    notifyListeners();
  }

  setRefresh(bool val) {
    isRefresh = val;
    notifyListeners();
  }

  onRefresh() async {
    await init();
    actorDetailsPaginatedController.refreshCompleted();
    notifyListeners();
  }
}
