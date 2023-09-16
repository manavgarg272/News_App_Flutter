import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:new_app/core/services/network_service/network_call_service.dart';
import 'package:new_app/features/home_screen/data/model/get_news_model.dart';
import 'dart:developer';

abstract class GetNewsListDataDs {
  Future<List<NewsModel>> getNewsListDataDs();
  Future<NewsModel> getNewsDataByIdDs({required int id});
}

class GetNewsListDataDsImpl extends GetNewsListDataDs {
  final NetworkCallService _networkCallService = NetworkCallService();
  @override
  Future<List<NewsModel>> getNewsListDataDs() async {
    List<NewsModel> listNewsData = [];
    String url = "/posts";
    Response response = await _networkCallService.get(url);

    for (var data in response.data) {
      listNewsData.add(NewsModel.fromJson(data));
    }
    return listNewsData;
  }

  @override
  Future<NewsModel> getNewsDataByIdDs({required int id}) async {
    String url = "/posts/$id";
    Response response = await _networkCallService.get(url);
    print("newsreponsedata ${response.data}");
    return NewsModel.fromJson(response.data);
  }
}
