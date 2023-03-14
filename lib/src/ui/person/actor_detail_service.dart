import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_config.dart';
import '../../models/person_model.dart';

final actorDetailServiceProvider = Provider<ActorDetailService>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return ActorDetailService(config, Dio());
});

class ActorDetailService {
  ActorDetailService(
    this._environmentConfig,
    this._dio,
  );

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  ///Movie details endpoint
  Future<ActorDetail> getActorDetail(int actorId) async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/person/$actorId?api_key=${_environmentConfig.movieApiKey}",
    );

    return ActorDetail.fromMap(response.data);
  }
}
