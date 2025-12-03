import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/entities/response/login_response_entity.dart';
import 'package:shoping_app/feature/auth/domain/repo/repo/auth_repo.dart';

import '../../data/repo/repo/auth_repo_impl.dart';

class LoginUseCase{
  LoginUseCase(this._repo);
  final AuthRepo _repo;
  Future<ResultApi<LoginResponseEntity>>call(LoginRequestEntity request)=>
      _repo.loginAuth(request);
}
LoginUseCase injectLoginUseCase() =>LoginUseCase(injectAuthRepoImpl());