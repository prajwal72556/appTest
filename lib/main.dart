import 'package:flutter/widgets.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/NumberScreen.dart';
import 'package:flutter_riverpod_practice/futureProvider.dart';
import 'package:flutter_riverpod_practice/homeScreenFutureProvider.dart';
import 'package:flutter_riverpod_practice/screens/my_home_screen.dart';
import 'package:flutter_riverpod_practice/user.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';

//class Test {}

final nameProvider = Provider((ref) => "Prajwal Kadam");
final nameProvider1 = StateProvider<String?>((ref) => null);
final userprovider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier(User(age: 21, name: "prajwal")));

final fetchUserProvider = FutureProvider((
  ref,
) {
  final userprovider = ref.watch(userRepoProvider);
  return userprovider.fetchdata("1");
});

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          HomeScreen(), //MyHomeScreen(), //NumberScreen() //HomeScreen2() //HomeScreen(),
    );
  }
}
