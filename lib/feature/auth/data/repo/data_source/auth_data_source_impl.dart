import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/models/request/login_request_dto.dart';
import 'package:shoping_app/feature/auth/data/models/request/register_request_dto.dart';
import 'package:shoping_app/feature/auth/data/models/response/login_response_dto.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/register_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/entities/response/login_response_entity.dart';
import 'package:shoping_app/feature/auth/domain/repo/data_source/auth_data_source_interface.dart';
import '../../../domain/entities/response/register_response_entity.dart';
import '../../api/auth_api.dart';
import '../../models/response/register_response_dto.dart';

class AuthDataSourceImpl implements AuthDataSourceInterface{
  AuthDataSourceImpl(this._authApi);
  final AuthApi _authApi;

  @override
  Future<ResultApi<LoginResponseEntity>> loginAuth(LoginRequestEntity request)async {
    final result = await _authApi.loginAuth(LoginRequestDto(
      email: request.email,
      password: request.password,
    ));
    switch(result) {
      case  SuccessApi<LoginResponseDto>():
        return SuccessApi<LoginResponseEntity>(result.data?.toEntity());
      case ErrorApi<LoginResponseDto>():
        return ErrorApi<LoginResponseEntity>(result.errorMessage);

    }

  }

  @override
  Future<ResultApi<RegisterResponseEntity>> registerAuth(RegisterRequestEntity request) async{
 final result = await _authApi.registerAuth(RegisterRequestDto(
  email: request.email,
   name: request.name,
   password: request.password,
 ));
 switch(result) {
   case  SuccessApi<RegisterResponseDto>():
     return SuccessApi<RegisterResponseEntity>(result.data?.toEntity());
   case ErrorApi<RegisterResponseDto>():
     return ErrorApi<RegisterResponseEntity>(result.errorMessage);
 }

  }
}

AuthDataSourceInterface injectAuthDataSourceImpl()=>
    AuthDataSourceImpl(injectAuthApi());

