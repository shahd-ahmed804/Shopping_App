import 'package:shoping_app/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/entities/response/login_response_entity.dart';
import '../../../../../core/network/result_api.dart';
import '../../entities/request/register_request_entity.dart';
import '../../entities/response/register_response_entity.dart';


abstract class AuthRepo {
  Future<ResultApi<LoginResponseEntity>>loginAuth(LoginRequestEntity request);
  Future<ResultApi<RegisterResponseEntity>> registerAuth(RegisterRequestEntity request);
}