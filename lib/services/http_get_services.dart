import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Post.dart';

class HttpGetPost {
  //https://jsonplaceholder.typicode.com/posts
  static const baseUrl = "http://jsonplaceholder.typicode.com";
  static const endpoint = '/posts';

  Future<List<Post>> getPost() async {
    List<Post> post = [];
    try {
      Uri postUri = Uri.parse("$baseUrl$endpoint");
      final response = await http.get(postUri);
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<dynamic> postlist = jsonDecode(response.body);
        for (var element in postlist) {
          Post singlepost = Post.fromMap(element);
          post.add(singlepost);
        }
      }
      print(post);
    } catch (e) {
      log(e.toString());
    }
    return post;
  }
}
