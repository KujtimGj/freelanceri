import 'dart:convert';
import 'package:Freelanceri/features/providers/userProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Freelanceri/core/api_urls.dart';
import 'package:Freelanceri/core/failures.dart';
import 'package:Freelanceri/features/model/userModel.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  var headers = {'Content-Type': 'application/json'};


  Future<Either<Failure, UserModel>> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var loginUrl = Uri.parse(loginRoute);
      var loginData = {'email': email, 'password': password};

      var response = await http.post(
        loginUrl,
        body: jsonEncode(loginData),
        headers: headers,
      );

      var decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var token = decodedData['token'];
        if (token != null) {
          await prefs.setString("token", token);
          Map<String, dynamic> payload = Jwt.parseJwt(token);
          prefs.setString("firstName", decodedData['business']['firstName']);
          prefs.setString("lastName", decodedData['business']['lastName']);
          prefs.setString("email", decodedData['business']['email']);
          prefs.setString("uuid", decodedData['business']['_id']);
          print(prefs.getString("firstName"));
          print(prefs.getString("lastName"));
          print(prefs.getString("uuid"));
          print("test");
        }

        // Parse the UserModel from the JSON data
        var userModel = UserModel.fromJson(decodedData['business']);
        return Right(userModel);
      } else if (response.statusCode == 401) {
        // Unauthorized - handle accordingly
        return Left(UnauthorizedFailure());
      } else {
        // Other errors
        print('Login failed - Status Code: ${response.statusCode}, Body: ${response.body}');
        return Left(ServerFailure());
      }
    } catch (e) {
      print('Error during login: $e');
      return Left(ServerFailure());
    }
  }


  Future<Either<Failure, UserModel>> register(UserModel userModel) async {
    try {
      var url = Uri.parse(registerRoute);
      var body = jsonEncode(userModel.toJson());

      print('Request URL: $url');
      print('Request Headers: $headers');
      print('Request Body: $body');

      var response = await http.post(
        url,
        body: body,
        headers: headers,
      );

      var decodedData = response.body.isNotEmpty ? jsonDecode(response.body) : null;

      if (response.statusCode == 200) {
        if (decodedData != null) {
          UserModel user = UserModel.fromJson(decodedData);
          print("Success");
          return Right(user);
        } else {
          print("error");
          return Left(ServerFailure(message: 'Invalid response data.'));
        }
      } else {
        print("HTTP Error: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return Left(ServerFailure());
      }

    } catch (e) {
      print('Error: $e');
      return Left(ServerFailure());
    }
  }
}
