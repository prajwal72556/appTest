import 'dart:convert';

class Post {
  final int uid;
  final String title;
  final String body;

  Post({
    required this.uid,
    required this.title,
    required this.body,
  });

  Post copyWith({
    int? uid,
    String? title,
    String? body,
  }) {
    return Post(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'title': title});
    result.addAll({'body': body});

    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      uid: map['uid']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() => 'Post(uid: $uid, title: $title, body: $body)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.uid == uid &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode => uid.hashCode ^ title.hashCode ^ body.hashCode;
}
