import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';
import 'states.dart';

class QuotesController extends Cubit<QuotesState> {
  List<QuotesModel> listData = [];
  String url = 'https://breakingbadapi.com/api/quotes';
  static QuotesController get(context) => BlocProvider.of(context);
  QuotesController() : super(IntialState());
  Future<void> getQuotesData() async {
    Response response = await Dio().get(url);
    var resp = response.data as List;

    for (int i = 0; i < resp.length; i++) {
      listData.add(QuotesModel.fromJson(resp[i]));
    }
    emit(ChangState());
  }
}
