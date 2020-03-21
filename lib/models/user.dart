class User {
  final String uuid;
  final String username;
  final String password;
  final bool active;

  const User({
    this.uuid,
    this.username,
    this.password,
    this.active,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json["uuid"],
      username: json["username"],
      password: json["password"],
      active: json["active"],
    );
  }

  Map toJson() {
    return {
      "uuid": uuid,
      "username": username,
      "password": password,
      "active": active,
    };
  }
}
