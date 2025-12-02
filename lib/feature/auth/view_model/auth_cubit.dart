import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/core/network/result_api.dart';
import 'package:shoping_app/feature/auth/data/api/auth_api.dart';
import 'package:shoping_app/feature/auth/data/models/request/login_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/request/register_request_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/login_response_model.dart';
import 'package:shoping_app/feature/auth/data/models/response/register_response_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  LoginResponseModel?token;
  RegisterResponseModel? dataUser;
  Future<void> login(LoginRequestModel request)async{
    emit(LoadingState());
 final result = await AuthApi.loginAuth(request);
 switch(result) {
   case SuccessApi<LoginResponseModel>():
     token= result.data;
   emit(SuccessState());
   case ErrorApi<LoginResponseModel>():
     emit(ErrorState(result.errorMessage));
 }
  }

  Future<void> register(RegisterRequestModel request)async{
    emit(LoadingState());
    final result = await AuthApi.registerAuth(request);
    switch(result) {
      case SuccessApi<RegisterResponseModel>():
       dataUser= result.data;
       emit(SuccessState());
      case ErrorApi<RegisterResponseModel>():
        emit(ErrorState(result.errorMessage));
    }
  }
}
