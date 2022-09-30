import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../app_exception.dart';
import 'BaseApiServices.dart';

class NetworkService extends BaseApiService{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data)  async{
    dynamic responseJson;
    try{
      Response response = await http.post(
          Uri.parse(url),
          headers: { "content-type": "application/x-www-form-urlencoded",
          },
          body: data
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet');
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server, with status code'
                +response.statusCode.toString());
    }
  }

}