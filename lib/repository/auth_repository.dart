import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/app_urls.dart';

class AuthRepository{
  BaseApiService _apiservice = NetworkService();

  Future<dynamic> LoginApiFun(dynamic data) async{
    try{
      dynamic reponse = await _apiservice.getPostApiResponse(AppUrls.LoginApiEndpoint, data);
      return reponse;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> RegisterApiFun(dynamic data) async{
    try{
      dynamic reponse = await _apiservice.getPostApiResponse(AppUrls.RegisterApiEndpoint, data);
      return reponse;
    }catch(e){
      throw e;
    }
  }
}