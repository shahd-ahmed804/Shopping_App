import 'package:shoping_app/feature/auth/domain/entities/request/login_request_entity.dart';

class LoginRequestDto {

  LoginRequestDto({this.email, this.password});
  String? email;
  String? password;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  LoginRequestEntity toEntity()=> LoginRequestEntity(
    email: email ??'',
    password: password ??'',
  );
}