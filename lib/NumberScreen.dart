import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/staream_provider.dart';

class NumberScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stream = ref.watch(streamnumberprovider);
    return Scaffold(
      appBar: AppBar(
        title: Text("nUMBERS sCREEN "),
      ),
      body: stream.when(
          data: (data) {
            return Center(
              child: Text("$data"),
            );
          },
          error: ((error, stackTrace) => Center(
                child: Text(error.toString()),
              )),
          loading: () {
            return CircularProgressIndicator();
          }),
    );
  }

  // @override
  // Widget build(BuildContext context, Widget ref) {

  // }
}
