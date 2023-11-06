class UserModel {
  String id;
  String name;
  String surname;
  String photoUrl;
  String username;
  bool online;
  String lastEnteredToApp;
  String bio;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.lastEnteredToApp,
    required this.online,
  });

  factory UserModel.fromJson(dynamic json) => UserModel(
    name: json['name'] as String,
    surname: json['surname'] as String,
    photoUrl: json['photoUrl'] as String,
    username: json['username'] as String,
    online: json['online'] as bool,
    lastEnteredToApp: json['lastEnteredToApp'] as String,
    bio: json['bio'] as String,
    id: json['id'] as String,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'photoUrl': photoUrl,
    'username': username,
    'online': online,
    'lastEnteredToApp': lastEnteredToApp,
    'bio': bio,
    'id': id,
  };
}