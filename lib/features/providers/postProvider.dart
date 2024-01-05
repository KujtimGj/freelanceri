import 'dart:convert';

import 'package:Freelanceri/features/screens/freelancer/home/home.dart';
import 'package:flutter/material.dart';
import 'package:Freelanceri/features/controllers/createPostController.dart';
import 'package:Freelanceri/features/controllers/readPostController.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:provider/provider.dart';

class PostProvider extends ChangeNotifier {
  PostsController? postController;
  CreatePostController? createPostController;
  List<PostModel> _posts = [];

  List<PostModel> getPosts() => _posts;


  getAllPosts(context) async {
    postController = PostsController();
    var result = await postController!.getPosts();
    return result.fold(
          (failure) {
        print(failure); // Handle failure appropriately
      },(posts) async {
        _posts = posts;
        notifyListeners();
      });
  }
  Future<void> createPost(PostModel postModel,context) async {

    createPostController = CreatePostController();
    if (createPostController == null) {
      print('CreatePostController is null');
      return;
    }

    var result = await createPostController!.createPost(postModel);
    result.fold(
          (failure) {
        print(failure);
      },
          (createdPost) {
        _posts.add(createdPost);
        notifyListeners();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Home()), (route) => false);
      },
    );
  }


}
