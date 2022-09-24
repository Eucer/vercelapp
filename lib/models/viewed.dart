import 'dart:convert';

class Viewed {
  final String userId;
  final double viewed;
  Viewed({
    required this.userId,
    required this.viewed,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'viewed': viewed,
    };
  }

  factory Viewed.fromMap(Map<String, dynamic> map) {
    return Viewed(
      userId: map['userId'] ?? '',
      viewed: map['viewed']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Viewed.fromJson(String source) => Viewed.fromMap(json.decode(source));
}
