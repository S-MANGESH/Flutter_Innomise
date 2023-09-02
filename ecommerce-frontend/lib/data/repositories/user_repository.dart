import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/api.dart';
import 'package:ecommerce/data/models/user/user_model.dart';

class UserRepository {
  final _api = Api();

  Future<UserModel> createAccount(
      {required String email, required String password}) async {
    try {
      Response response = await _api.sendRequest.post("/user/createAccount",
          data: jsonEncode({"email": email, "password": password}));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return UserModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      Response response = await _api.sendRequest.post("/user/signIn",
          data: jsonEncode({"email": email, "password": password}));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return UserModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }

  Future<UserModel> updateUser(UserModel userModel) async {
    // give me userModel,i'll insert data in it and return to you
    try {
      Response response = await _api.sendRequest
          .put("/user/${userModel.sId}", data: jsonEncode(userModel.toJson()));
      //send request by using Api function in api.dart

      ApiResponse apiResponse = ApiResponse.fromResponse(
          response); //segregate data by using ApiResponse(from api.dart)
      // simply instead of api.dart you can use apiResponce function here diretly

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return UserModel.fromJson(
          apiResponse.data); // return data in the model format
    } catch (ex) {
      rethrow;
    }
  }
}
