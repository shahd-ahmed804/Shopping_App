
import '../../../../../core/network/result_api.dart';
import '../../models/request/login_request_model.dart';
import '../../models/request/register_request_model.dart';
import '../../models/response/login_response_model.dart';
import '../../models/response/register_response_model.dart';

abstract class AuthDataSourceInterface {
  Future<ResultApi<LoginResponseModel>>loginAuth(LoginRequestModel request);
  Future<ResultApi<RegisterResponseModel>> registerAuth(RegisterRequestModel request);
}