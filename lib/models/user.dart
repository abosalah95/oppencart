import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  //String userPassword;
  String username;
  String key;


  User({
    this.username,
    //this.userPassword,
    this.key,

  });


  factory User.fromJson(Map<String, dynamic> json) => User(
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
