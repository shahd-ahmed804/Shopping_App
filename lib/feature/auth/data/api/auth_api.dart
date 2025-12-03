
import 'dart:convert';
import 'package:shoping_app/core/constants/app_apis.dart';
import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/models/request/login_request_dto.dart';
import 'package:http/http.dart' as http;
import '../models/request/register_request_dto.dart';
import '../models/response/login_response_dto.dart';
import '../models/response/register_response_dto.dart';

 class AuthApi {
  Future<ResultApi<LoginResponseDto>>loginAuth(LoginRequestDto request)async{
    try{
      Uri url =Uri.https(AppApis.baseUrl,AppApis.loginEndPoint);
      var response = await http.post(url,body: request.toJson());
      String responseBody = response.body;
      var json=  jsonDecode(responseBody);
      if(response.statusCode==401) {
        return ErrorApi<LoginResponseDto>("don't have account please try register ");
      }else{
        return SuccessApi<LoginResponseDto>(
            LoginResponseDto.fromJson(json));
      }
    }catch(e){
    return ErrorApi<LoginResponseDto>(e.toString());
    }
  }

  Future<ResultApi<RegisterResponseDto>> registerAuth(RegisterRequestDto request)async{
  try{
    Uri url = Uri.https(AppApis.baseUrl,AppApis.registerEndPoint);
    var response = await http.post(url,body: request.toJson());
    var json = jsonDecode( response.body);
    return SuccessApi<RegisterResponseDto>(RegisterResponseDto.fromJson(json));
  }catch(e){
    return ErrorApi<RegisterResponseDto>(e.toString());
  }
  }
}
AuthApi injectAuthApi()=> AuthApi();