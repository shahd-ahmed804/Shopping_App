import 'package:dio/dio.dart';
import 'package:shoping_app/core/constants/app_apis.dart';
import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/api/auth_api.dart';
import 'package:shoping_app/feature/auth/data/models/request/login_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/request/register_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/login_response_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/register_response_model.dart';

class AuthDioApi  extends AuthApi{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://${AppApis.baseUrl}",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  @override
  Future<ResultApi<LoginResponseModel>> loginAuth(
      LoginRequestModel request) async {
    try {
      Response response = await _dio.post(
        AppApis.loginEndPoint,
        data: request.toJson(),
      );

      return SuccessApi<LoginResponseModel>(
        LoginResponseModel.fromJson(response.data),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return ErrorApi<LoginResponseModel>(
            "Don't have account, please try register");
      }
      return ErrorApi<LoginResponseModel>(e.message ?? "Unknown Error");
    } catch (e) {
      return ErrorApi<LoginResponseModel>(e.toString());
    }
  }



@override
  Future<ResultApi<RegisterResponseModel>> registerAuth(
      RegisterRequestModel request) async {
    try {
      Response response = await _dio.post(
        AppApis.registerEndPoint,
        data: request.toJson(),
      );

      return SuccessApi<RegisterResponseModel>(
        RegisterResponseModel.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ErrorApi<RegisterResponseModel>(e.message ?? "Unknown Error");
    } catch (e) {
      return ErrorApi<RegisterResponseModel>(e.toString());
    }
  }
}
