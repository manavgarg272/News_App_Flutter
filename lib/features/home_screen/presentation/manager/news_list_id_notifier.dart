

import 'package:flutter/material.dart';
import 'package:new_app/features/home_screen/data/data_source/get_news_ds.dart';
import 'package:new_app/features/home_screen/data/model/get_news_model.dart';
import 'package:new_app/features/home_screen/data/repository_impl/get_new_repo_impl.dart';
import 'package:new_app/features/home_screen/domain/usecase/get_news_uc.dart';

import '../../domain/usecase/get_news_by_id_uc.dart';

enum GetNewsDataByIdNotifierState { loading, loaded, error, initated }

class GetNewsDataByIdNotifier extends ChangeNotifier {
  final GetNewsByIdUc _getNewsDataByIdData = GetNewsByIdUc(
    getNewsRepo:
          GetNewsDataRepoImpl(getNewsDataDs: GetNewsListDataDsImpl()));

  late NewsModel _newsDataById;
  NewsModel get newsDataById => _newsDataById;
  set newsDataById(NewsModel value) {
    _newsDataById = value;
    notifyListeners();
  }

  GetNewsDataByIdNotifierState _getNewsIdNotifierState =
  GetNewsDataByIdNotifierState.initated;
  GetNewsDataByIdNotifierState get getNewsIdNotifierState => _getNewsIdNotifierState;
  set getNewsIdNotifierState(GetNewsDataByIdNotifierState value) {
    _getNewsIdNotifierState = value;
    notifyListeners();
  }

  getNewsDataById({required int id}) async {
    try {

      getNewsIdNotifierState = GetNewsDataByIdNotifierState.loading;
      newsDataById = await _getNewsDataByIdData(id);
      getNewsIdNotifierState = GetNewsDataByIdNotifierState.loaded;

    } catch (e) {

      
    }
  }
}
