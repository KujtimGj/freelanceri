import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:Freelanceri/core/api_urls.dart';
import 'package:Freelanceri/core/failures.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:http/http.dart' as http;

class CreatePostController {
  static const Map<String, String> headers = {"Content-Type": "application/json"};
  static const String createPostEndpoint = "$createAPost";

  Future<Either<Failure, PostModel>> createPost(PostModel postModel) async {
    try {
      var url = Uri.parse(createPostEndpoint);
      var response = await http.post(
        url,
        body: jsonEncode(postModel.toJson()),
        headers: headers,
      );

      var decodedData = jsonDecode(response.body);
      print(decodedData);

      if (response.statusCode == 200) {
        return Right(PostModel.fromJson(decodedData));
      } else {
        print(response.statusCode);
        // You might want to handle different error codes appropriately
        return Left(ServerFailure());
      }
    } catch (e) {
      print('Exception during createPost: $e');
      return Left(ServerFailure()); // or handle the exception appropriately
    }
  }
}