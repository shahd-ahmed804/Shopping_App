import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/models/request/login_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/request/register_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/login_response_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/register_response_model.dart';
import 'package:shoping_app/feature/auth/data/repo/data_source/auth_data_source_interface.dart';
import 'package:shoping_app/feature/auth/data/repo/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this._datasource);
  final AuthDataSourceInterface _datasource;
  @override
  Future<ResultApi<LoginResponseModel>> loginAuth(LoginRequestModel request)
  => _datasource.loginAuth(request);

  @override
  Future<ResultApi<RegisterResponseModel>> registerAuth(RegisterRequestModel request)
  => _datasource.registerAuth(request);

}