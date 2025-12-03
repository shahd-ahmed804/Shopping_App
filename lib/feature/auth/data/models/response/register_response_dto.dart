import 'package:shoping_app/feature/auth/domain/entities/response/register_response_entity.dart';

class RegisterResponseDto {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  RegisterResponseDto(
      {this.id,
        this.email,
        this.password,
        this.name,
        this.role,
        this.avatar,
        this.creationAt,
        this.updatedAt});

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  RegisterResponseEntity toEntity()=> RegisterResponseEntity(
  name: name??'',
  email: email??'',
  id: id ?? 0,
  password: password??'' ,
  avatar: avatar??'',
    role: role??'',
      );
}