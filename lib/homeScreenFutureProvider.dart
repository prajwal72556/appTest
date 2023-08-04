import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/main.dart';

class HomeScreen2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          title: Text(data.name),
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) {},
            ),
            Center(
              child: Text(data.name),
            )
          ],
        ),
      );
    }, error: (error, StackTrace) {
      return const Center(
        child: Text("Error"),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
