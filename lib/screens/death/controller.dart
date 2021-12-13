import 'package:bloc/bloc.dart';
import 'package:breakbaddata/screens/death/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';

class DeathController extends Cubit<DeathState> {
  List<DeathModel> listData = [];
  String url = 'https://breakingbadapi.com/api/deaths';
  static DeathController get(context) => BlocProvider.of(context);
  DeathController() : super(IntialDeathState());
  Future<void> getDeathData() async {
    Response response = await Dio().get(url);
    var resp = response.data as List;

    for (int i = 0; i < resp.length; i++) {
      listData.add(DeathModel.fromJson(resp[i]));
    }
    emit(ChangDeathState());
  }
}
