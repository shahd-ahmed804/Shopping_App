class LoginResponseModel {

  LoginResponseModel({this.accessToken, this.refreshToken});
  String? accessToken;
  String? refreshToken;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

}