import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/entities/response/login_response_entity.dart';
import 'package:shoping_app/feature/auth/domain/repo/data_source/auth_data_source_interface.dart';
import 'package:shoping_app/feature/auth/domain/repo/repo/auth_repo.dart';

import '../../../domain/entities/request/register_request_entity.dart';
import '../../../domain/entities/response/register_response_entity.dart';
import '../data_source/auth_data_source_impl.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._datasource);
  final AuthDataSourceInterface _datasource;
  @override
  Future<ResultApi<LoginResponseEntity>> loginAuth(LoginRequestEntity request)
  => _datasource.loginAuth(request);

  @override
  Future<ResultApi<RegisterResponseEntity>> registerAuth(RegisterRequestEntity request)
  => _datasource.registerAuth(request);

}

AuthRepo injectAuthRepoImpl()=>
    AuthRepoImpl(injectAuthDataSourceImpl());