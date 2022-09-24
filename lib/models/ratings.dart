import 'dart:convert';

class Rating {
  final String userId;
  final String userName;
  final String userComment;
  final double rating;
  Rating({
    required this.userId,
    required this.userName,
    required this.userComment,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userComment': userComment,
      'rating': rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userComment: map['userComment'] ?? 'Comentario no agregado',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}
