import 'dart:developer';
import 'package:hive/hive.dart';

class LocalDb {
  String boxName = "password";
  String key1 = "firstName";
  String key2 = "lastName";

  ///add
  void add(String pin, String key)  {
    var box = Hive.box(boxName);
    box.put(key, pin);
    log('saved');
  }

  ///get
  String get(String key)  {
    var box = Hive.box(boxName);
    final result = box.get(key);
    return result;
  }

  ///delete
  Future<void> delete(String key) async {
    var box = await Hive.openBox(boxName);
    box.delete(key);
  }
}
