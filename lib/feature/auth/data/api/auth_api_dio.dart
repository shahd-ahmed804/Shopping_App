import 'package:dio/dio.dart';
import 'package:shoping_app/core/constants/app_apis.dart';
import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/api/auth_api.dart';
import '../models/request/login_request_dto.dart';
import '../models/request/register_request_dto.dart';
import '../models/response/login_response_dto.dart';
import '../models/response/register_response_dto.dart';


class AuthDioApi  extends AuthApi{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://${AppApis.baseUrl}",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  @override
  Future<ResultApi<LoginResponseDto>> loginAuth(
      LoginRequestDto request) async {
    try {
      Response response = await _dio.post(
        AppApis.loginEndPoint,
        data: request.toJson(),
      );

      return SuccessApi<LoginResponseDto>(
        LoginResponseDto.fromJson(response.data),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return ErrorApi<LoginResponseDto>(
            "Don't have account, please try register");
      }
      return ErrorApi<LoginResponseDto>(e.message ?? "Unknown Error");
    } catch (e) {
      return ErrorApi<LoginResponseDto>(e.toString());
    }
  }



@override
  Future<ResultApi<RegisterResponseDto>> registerAuth(
      RegisterRequestDto request) async {
    try {
      Response response = await _dio.post(
        AppApis.registerEndPoint,
        data: request.toJson(),
      );

      return SuccessApi<RegisterResponseDto>(
        RegisterResponseDto.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ErrorApi<RegisterResponseDto>(e.message ?? "Unknown Error");
    } catch (e) {
      return ErrorApi<RegisterResponseDto>(e.toString());
    }
  }
}
