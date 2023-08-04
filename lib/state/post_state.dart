import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/services/http_get_services.dart';

import '../models/Post.dart';

final postPorovider =
    StateNotifierProvider<PostNotifier, PostState>((ref) => PostNotifier());

@immutable
abstract class PostState {}

class InitialPostState extends PostState {}

class PostsLoadingState extends PostState {}

class PostsLoadedState extends PostState {
  final List<Post> posts;

  PostsLoadedState({required this.posts});
}

class ErrorPostState extends PostState {
  final String error;
  ErrorPostState({required this.error});
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(InitialPostState());
  final HttpGetPost _httpgetpost = HttpGetPost();

  fetchPosts() async {
    try {
      print("Here");
      state = PostsLoadingState();
      List<Post> posts = await _httpgetpost.getPost();
      print("hhh");
      state = PostsLoadedState(posts: posts);
    } catch (e) {
      state = ErrorPostState(error: e.toString());
    }
  }
}
