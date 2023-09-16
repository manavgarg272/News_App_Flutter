



import 'package:new_app/core/usecases/usecases.dart';
import 'package:new_app/features/home_screen/data/model/get_news_model.dart';
import 'package:new_app/features/home_screen/domain/repo/get_news_repo.dart';

class GetNewsDataUcData extends UseCaseForNoParams<List<NewsModel>>{

  final GetNewsDataRepo getNewsRepoData;
  GetNewsDataUcData({required this.getNewsRepoData}); 
  @override
  Future<List<NewsModel>> call() {
    return getNewsRepoData.getNewsListData();
  }
}



