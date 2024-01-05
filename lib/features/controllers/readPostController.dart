import 'package:dartz/dartz.dart';
import 'package:Freelanceri/core/api_urls.dart';
import 'package:Freelanceri/core/failures.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsController{
  var headers = {"Content-Type":"application/json"};

  Future<Either<Failure,List<PostModel>>> getPosts() async{
    var url = Uri.parse("$host$allPosts");
    print("$host$allPosts");
    var res = await http.get(url,headers: headers);
    var decodedData = jsonDecode(res.body);

    if(res.statusCode ==200){
      List<PostModel> posts = decodedData.map<PostModel>((json)=>PostModel.fromJson(json)).toList();
      return Right(posts);
    }else{
      print("object");
      return Left(ServerFailure());
    }
  }
}