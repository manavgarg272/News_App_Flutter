


import 'package:new_app/features/home_screen/data/model/get_news_model.dart';

abstract class GetNewsDataRepo {
   Future<List<NewsModel>> getNewsListData();
   Future<NewsModel> getNewsDataById({required int id});
}