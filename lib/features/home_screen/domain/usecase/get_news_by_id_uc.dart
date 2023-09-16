

import 'package:new_app/core/usecases/usecases.dart';
import 'package:new_app/features/home_screen/data/model/get_news_model.dart';

import '../repo/get_news_repo.dart';

class GetNewsByIdUc extends UseCase<NewsModel,int>{

  final GetNewsDataRepo getNewsRepo;

  GetNewsByIdUc({required this.getNewsRepo});
  
  @override
  Future<NewsModel> call(int params) {

    return getNewsRepo.getNewsDataById(id: params);
  }
 

}