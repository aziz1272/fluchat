import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluchat/src/models/user_model.dart';

class RealDatabaseServices {
  FirebaseDatabase database = FirebaseDatabase.instance;

  ///Add
  Future<void> add(UserModel user) async {
    DatabaseReference ref = database.ref('users/${user.id}');
    await ref.set(user.toJson());
  }

  ///Add
  Future<void> update(UserModel user) async {
    DatabaseReference ref = database.ref('users/${user.id}');
    await ref.update(user.toJson());
  }

  ///Get
  Future<UserModel?> get() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String id = firebaseAuth.currentUser!.uid;
    DatabaseReference ref = database.ref('users');
    try {
      final data = await ref.child('/$id').get();
      return UserModel.fromJson(data.value);
    } catch (e, s) {
      log("Error on getting user: ", error: e, stackTrace: s);
      return null;
    }
  }

  Future delete(String id) async {
    DatabaseReference ref = database.ref('users');
    await ref.child('/$id').remove();
  }

  Future<UserModel?> searchUser(String username) async {
    UserModel? findUser;
    DatabaseReference ref = database.ref('users');
    try {
      DataSnapshot event = await ref.get();
      var map = event.value as Map;
      map.forEach((key, value) {
        UserModel? model;
        try {
          model = UserModel.fromJson(value);
        } catch (error) {
          log("Parsing  error: ", error: error);
        }
        if (model != null) {
          if (model.username == username) {
            findUser = model;
          }
        }
      });
    } catch (error) {
      log("Searching error: ", error: error);
      return null;
    }
    return findUser;
  }
}