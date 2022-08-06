import 'package:flutter/material.dart';
import 'package:mvvm_api/repositories/posts/posts_api.dart';
import 'package:mvvm_api/view_models/post_view_model.dart';

import '../../view_models/posts_view_model.dart';

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  var postsViewModel = PostsViewModel();

  @override
  Widget build(BuildContext context) {
    // here need to do Reference viewModel

    // Dependency Injection
    var _postsViewModel = PostsViewModel(postsRepository: PostsAPI());
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Container(
          child: Center(
              child: FutureBuilder<List<PostViewModel>>(
                  future: _postsViewModel.fetchAllPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var posts = snapshot.data;
                      return ListView.builder(
                          itemCount: posts?.length,
                          itemBuilder: (context, index) => Container(
                                child: Text(posts![index].title),
                              ));
                    }
                  }))),
    );
  }
}
