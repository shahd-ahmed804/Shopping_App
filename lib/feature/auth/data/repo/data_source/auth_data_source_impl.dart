import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/models/request/login_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/request/register_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/login_response_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/register_response_model.dart';
import 'package:shoping_app/feature/auth/data/repo/data_source/auth_data_source_interface.dart';
import '../../api/auth_api.dart';

class AuthDataSourceImpl extends AuthDataSourceInterface{
  AuthDataSourceImpl(this._authApi);
  final AuthApi _authApi;
  @override
  Future<ResultApi<LoginResponseModel>> loginAuth(LoginRequestModel request)async {
    final result = await  _authApi.loginAuth(request);
  switch(result){
    case SuccessApi<LoginResponseModel>():
    return SuccessApi<LoginResponseModel>(result.data);
    case ErrorApi<LoginResponseModel>():
      return ErrorApi<LoginResponseModel>(result.errorMessage);
  }
  }

  @override
  Future<ResultApi<RegisterResponseModel>> registerAuth(RegisterRequestModel request) async{
    final result = await _authApi.registerAuth(request);
    switch(result) {
      case SuccessApi<RegisterResponseModel>():
       return SuccessApi<RegisterResponseModel>(result.data);
      case ErrorApi<RegisterResponseModel>():
       return ErrorApi<RegisterResponseModel>(result.errorMessage);
    }
  }
}