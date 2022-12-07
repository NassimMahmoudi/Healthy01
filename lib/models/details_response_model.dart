import 'dart:convert';

DetailsResponseModel detailsResponseModel(String str) =>
    DetailsResponseModel.fromJson(json.decode(str));

class DetailsResponseModel {
  DetailsResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  DetailsResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.age,
    required this.details,
    required this.id,
  });
  late final String username;
  late final String email;
  late final String password;
  late final String phone;
  late final String age;
  late final Object details;
  late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    age = json['age'];
    details = json['details'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['age'] = age;
    _data['details'] = details;
    _data['id'] = id;
    return _data;
  }
}
