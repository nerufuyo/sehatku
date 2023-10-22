class User {
  final String token;
  final String error;

  User({
    required this.token,
    required this.error,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "error": error,
      };
}
