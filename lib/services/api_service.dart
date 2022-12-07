import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:healthy01/config.dart';
import 'package:healthy01/models/details_request_model.dart';
import 'package:healthy01/models/details_response_model.dart';
import 'package:healthy01/models/login_request_model.dart';
import 'package:healthy01/models/register_response_model.dart';
import 'package:healthy01/services/shared_service.dart';
import 'package:http/http.dart' as http;

import '../models/login_response_model.dart';
import '../models/register_request_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.appURL, Config.loginAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      print('***   SharedService   ***  ');
      final Map parsed = json.decode(response.body);
      print(parsed['data']['id']);
      var sessionManager = SessionManager();
      await sessionManager.set("id", parsed['data']['id']);
      await sessionManager.set("username", parsed['data']['username']);
      await sessionManager.set("email", parsed['data']['email']);
      await sessionManager.set("phone", parsed['data']['phone']);
      await sessionManager.set("age", parsed['data']['age']);

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.appURL, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return registerResponseModel(response.body);
  }

  static Future<DetailsResponseModel> addDetails(
      DetailsRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.appURL, Config.detailsAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return detailsResponseModel(response.body);
  }
}
