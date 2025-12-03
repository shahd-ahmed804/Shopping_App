
import 'package:shoping_app/feature/auth/domain/repo/repo/auth_repo.dart';
import '../../../../core/network/result_api.dart';
import '../../data/repo/repo/auth_repo_impl.dart';
import '../entities/request/register_request_entity.dart';
import '../entities/response/register_response_entity.dart';

class RegisterUseCase {
  RegisterUseCase(this._repo);
  final AuthRepo _repo;
  Future<ResultApi<RegisterResponseEntity>> call(RegisterRequestEntity request)=>
      _repo.registerAuth(request);
}
RegisterUseCase injectRegisterUseCase() =>RegisterUseCase(injectAuthRepoImpl());