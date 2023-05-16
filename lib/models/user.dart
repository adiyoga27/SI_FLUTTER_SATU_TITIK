
class UserModel {
    int id;
    String name;
    String username;
    String email;
    String role;
    dynamic emailVerifiedAt;
    String hp;
    dynamic token;

    UserModel({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.role,
        this.emailVerifiedAt,
        required this.hp,
        this.token,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"],
        hp: json["hp"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "role": role,
        "email_verified_at": emailVerifiedAt,
        "hp": hp,
        "token": token,
    };
}
