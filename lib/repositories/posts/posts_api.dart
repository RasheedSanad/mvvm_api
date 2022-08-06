import 'package:dio/dio.dart';
import 'package:mvvm_api/models/post_model.dart';

import 'posts_repository.dart';

class PostsAPI extends PostsRepository {
  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];
    try {
      var response =
          await Dio().get("http://jsonplaceholder.typicode.com/posts");
      var list = response.data as List;
      posts = list.map((posts) => PostModel.getJson(posts)).toList();
    } catch (exception) {
      print(exception.toString());
    }
    print(posts);
    return posts;
  }

  @override
  Future<PostModel> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}
