


import 'package:new_app/features/home_screen/data/data_source/get_news_ds.dart';
import 'package:new_app/features/home_screen/data/model/get_news_model.dart';

import '../../domain/repo/get_news_repo.dart';

class GetNewsDataRepoImpl extends GetNewsDataRepo{

  final GetNewsListDataDs getNewsDataDs;
  GetNewsDataRepoImpl({required  this.getNewsDataDs});
    
  @override
  Future<List<NewsModel>> getNewsListData() {
     return  getNewsDataDs.getNewsListDataDs();
  }
  
  @override
  Future<NewsModel> getNewsDataById({required int id}) {
    return getNewsDataDs.getNewsDataByIdDs(id: id);
  }
  

}