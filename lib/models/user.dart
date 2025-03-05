class User {
  String displayName;
  String language;
  String avatarPath;

  User({
    required this.displayName,
    required this.language,
    required this.avatarPath,
  });

  User copyWith({
    String? displayName,
    String? language,
    String? avatarPath,
  }) {
    return User(
      displayName: displayName ?? this.displayName,
      language: language ?? this.language,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
