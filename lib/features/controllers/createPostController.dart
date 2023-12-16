import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:Freelanceri/core/api_urls.dart';
import 'package:Freelanceri/core/failures.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:http/http.dart' as http;

class CreatePostController {
  static const Map<String, String> headers = {"Content-Type": "application/json"};

  Future<Either<Failure, PostModel>> createPost(PostModel postModel) async {
    try {
      var url = Uri.parse(createAPost);
      var response = await http.post(
        url,
        body: jsonEncode(postModel.toJson()),
        headers: headers,
      );

      var decodedData = jsonDecode(response.body);
      print(decodedData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(PostModel.fromJson(decodedData));
      } else {
        print(response.statusCode);
        return Left(ServerFailure());
      }
    } catch (e) {
      if (e is http.ClientException) {
        // Handle network-related errors
        return Left(OfflineFailure());
      } else {
        // Handle other exceptions
        print('Exception during createPost: $e');
        return Left(ServerFailure());
      }
    }
  }
}
