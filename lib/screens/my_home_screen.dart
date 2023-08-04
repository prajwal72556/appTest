import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/state/post_state.dart';

import '../models/Post.dart';

class MyHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home Screen"),
      ),
      body: Column(
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                PostState state = ref.watch(postPorovider);
                if (state is InitialPostState) {
                  return Text("Press Floating actionbutton ");
                } else if (state is PostsLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is ErrorPostState) {
                  return Text(state.error);
                } else if (state is PostsLoadedState) {
                  return SizedBox(
                    height: 700,
                    width: 300,
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        Post post = state.posts[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(post.uid.toString()),
                          ),
                          title: Text(post.title),
                        );
                      },
                    ),
                  );
                }
                return Text("Noting Found");
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postPorovider.notifier).fetchPosts();
        },
        child: Icon(Icons.add),
      ),
    );

    ;
  }
}
