import 'package:bloc/bloc.dart';
import 'package:breakbaddata/screens/characters/model.dart';
import 'package:breakbaddata/screens/characters/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersController extends Cubit<CharacterState> {
  List<AutoGenerate> listData = [];
  String url = 'https://breakingbadapi.com/api/characters';
  static CharactersController get(context) => BlocProvider.of(context);
  CharactersController() : super(IntialPageState());
  Future<void> getCharactersData() async {
    Response response = await Dio().get(url);
    var resp = response.data as List;

    for (int i = 0; i < resp.length; i++) {
      listData.add(AutoGenerate.fromJson(resp[i]));
    }
    emit(ChangState());
  }
}
