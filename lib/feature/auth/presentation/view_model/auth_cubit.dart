import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/register_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/entities/response/register_response_entity.dart';

import '../../domain/entities/response/login_response_entity.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
}) : super(AuthInitial());
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  LoginResponseEntity?token;
  RegisterResponseEntity? dataUser;
  Future<void> login(LoginRequestEntity request)async{
    emit(LoadingState());
 final result = await loginUseCase.call(request);
 switch(result) {
   case SuccessApi<LoginResponseEntity>():
     token= result.data;
   emit(SuccessState());
   case ErrorApi<LoginResponseEntity>():
     emit(ErrorState(result.errorMessage));
 }
  }

  Future<void> register(RegisterRequestEntity request)async{
    emit(LoadingState());
    final result = await registerUseCase.call(request);
    switch(result) {
      case SuccessApi<RegisterResponseEntity>():
       dataUser= result.data;
       emit(SuccessState());
      case ErrorApi<RegisterResponseEntity>():
        emit(ErrorState(result.errorMessage));
    }
  }
}
