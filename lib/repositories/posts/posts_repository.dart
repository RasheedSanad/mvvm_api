import 'package:mvvm_api/models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPostById(int id);
}
