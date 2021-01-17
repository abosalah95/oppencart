import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {

  //String userPassword;
  String username;
  String key;


  LoginRequest({
    this.username,
    //this.userPassword,
    this.key,

  });


  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    username: json["username"],
   // userPassword: json["userPassword"],
    key: json["key"],

  );

  Map<String, dynamic> toJson() => {
    "username": username,
    //"userPassword": userPassword,
    "key": key,
  };


}
