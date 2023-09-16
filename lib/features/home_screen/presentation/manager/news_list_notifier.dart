import 'package:flutter/material.dart';
import 'package:new_app/features/home_screen/data/data_source/get_news_ds.dart';
import 'package:new_app/features/home_screen/data/model/get_news_model.dart';
import 'package:new_app/features/home_screen/data/repository_impl/get_new_repo_impl.dart';
import 'package:new_app/features/home_screen/domain/usecase/get_news_uc.dart';

enum GetNewsDataNotifierState { loading, loaded, error, initated }

class GetNewsDataNotifier extends ChangeNotifier {
  final GetNewsDataUcData _getNewsDataUcData = GetNewsDataUcData(
      getNewsRepoData:
          GetNewsDataRepoImpl(getNewsDataDs: GetNewsListDataDsImpl()));

  List<NewsModel> _newsDataList = [];
  List<NewsModel> get newsDataList => _newsDataList;
  set newsDataList(List<NewsModel> value) {
    _newsDataList = value;
    notifyListeners();
  }

  GetNewsDataNotifierState _getNewsNotifierState =
      GetNewsDataNotifierState.initated;
  GetNewsDataNotifierState get getNewsNotifierState => _getNewsNotifierState;
  set getNewsNotifierState(GetNewsDataNotifierState value) {
    _getNewsNotifierState = value;
    notifyListeners();
  }

  getNewsDataList() async {
    try {

      getNewsNotifierState = GetNewsDataNotifierState.loading;
      newsDataList = await _getNewsDataUcData();
      getNewsNotifierState = GetNewsDataNotifierState.loaded;

    } catch (e) {

      
    }
  }
}
