import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/main.dart';
import 'package:flutter_riverpod_practice/user.dart';

class HomeScreen extends ConsumerWidget {
  //**this was used for StateNotifier Provider Example**

  void onsubmitted(String value, WidgetRef ref) {
    ref.read(nameProvider1.notifier).update((state) => value);

    ref.read(userprovider.notifier).updateName(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("build rebuild");
    final name = ref.watch(nameProvider1) ?? "";
    final user = ref.watch(userprovider);

    // log(user.name);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),

        // title: Text("hii"),
      ),
      body: Column(
        children: [
          // **this was used for StateNotifier Provider Example**
          TextFormField(
            onFieldSubmitted: (value) => onsubmitted(value, ref),
          ),
          Center(
            child: Text(user.age.toString()),
          ),
        ],
      ),
    );
  }
}
