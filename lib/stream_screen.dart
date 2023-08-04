import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NumberScreen.dart';

class StreamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NumberScreen();
            }));
          },
          child: const Center(
            child: Text("Press Me"),
          )),
    );
  }
}
