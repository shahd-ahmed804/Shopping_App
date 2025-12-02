
import 'dart:convert';
import 'package:shoping_app/core/constants/app_apis.dart';
import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/models/request/login_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:shoping_app/feature/auth/data/models/request/register_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/login_response_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/register_response_model.dart';

abstract class AuthApi {
 static Future<ResultApi<LoginResponseModel>>loginAuth(LoginRequestModel request)async{
    try{
      Uri url =Uri.https(AppApis.baseUrl,AppApis.loginEndPoint);
      var response = await http.post(url,body: request.toJson());
      String responseBody = response.body;
      var json=  jsonDecode(responseBody);
      if(response.statusCode==401) {
        return ErrorApi<LoginResponseModel>("don't have account please try register ");
      }else{
        return SuccessApi<LoginResponseModel>(
            LoginResponseModel.fromJson(json));
      }
    }catch(e){
    return ErrorApi<LoginResponseModel>(e.toString());
    }
  }

 static Future<ResultApi<RegisterResponseModel>> registerAuth(RegisterRequestModel request)async{
  try{
    Uri url = Uri.https(AppApis.baseUrl,AppApis.registerEndPoint);
    var response = await http.post(url,body: request.toJson());
    var json = jsonDecode( response.body);
    return SuccessApi<RegisterResponseModel>(RegisterResponseModel.fromJson(json));
  }catch(e){
    return ErrorApi<RegisterResponseModel>(e.toString());
  }

  }
}