// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;

class User1 {
  String name;
  String email;

  User1({
    required this.name,
    required this.email,
  });

  User1 copyWith({
    String? name,
    String? email,
  }) {
    return User1(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User1.fromMap(Map<String, dynamic> map) {
    return User1(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User1.fromJson(String source) =>
      User1.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User1(name: $name, email: $email)';

  @override
  bool operator ==(covariant User1 other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final userRepoProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User1> fetchdata(String id) {
    var url = "https://jsonplaceholder.typicode.com/users/$id";
    return http.get(Uri.parse(url)).then((value) => User1.fromJson(value.body));
  }
}
