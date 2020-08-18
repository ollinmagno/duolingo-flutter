import 'dart:convert' as convert;
import 'package:duolingo/src/sql/prefs.dart';

class User {
  String login;
  String name;
  String email;
  String urlPhoto;
  String token;
  List<String> roles;

  User(
      {this.login,
      this.name,
      this.email,
      this.urlPhoto,
      this.token,
      this.roles});

  User.firebase(
      {this.login,
      this.name,
      this.email,
      this.urlPhoto,
      this.token,
      this.roles});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['name'];
    email = json['email'];
    urlPhoto = json['urlPhoto'];
    token = json['token'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = login;
    data['name'] = name;
    data['email'] = email;
    data['urlPhoto'] = urlPhoto;
    data['token'] = token;
    data['roles'] = roles;
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    final Map map = toJson();

    final String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<User> get() async {
    final String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    final User user = User.fromJson(map);
    return user;
  }

  @override
  String toString() =>
    "User{login: $login, name: $name}";
  
}
