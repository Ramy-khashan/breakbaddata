import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';
import 'states.dart';

class EpisodesController extends Cubit<EpisodeState> {
  List<EpisodeModel> listData = [];
  String url = 'https://breakingbadapi.com/api/episodes';
  static EpisodesController get(context) => BlocProvider.of(context);
  EpisodesController() : super(IntialPageState());
  Future<void> getEpisodeData() async {
    Response response = await Dio().get(url);
    var resp = response.data as List;

    for (int i = 0; i < resp.length; i++) {
      listData.add(EpisodeModel.fromJson(resp[i]));
    }
    emit(ChangState());
  }
}
