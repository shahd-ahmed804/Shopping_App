import 'package:shoping_app/feature/auth/domain/entities/request/register_request_entity.dart';

class RegisterRequestDto {
  String? name;
  String? email;
  String? password;


  RegisterRequestDto({this.name, this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['avatar'] = "https://picsum.photos/800";
    return data;
  }

  RegisterRequestEntity toEntity()=> RegisterRequestEntity(
    name: name??'',
    email: email??'',
    password: password??'',
  );
}