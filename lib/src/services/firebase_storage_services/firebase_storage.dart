import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  static final storageRef = FirebaseStorage.instance.ref();
  static const String folder = "movies";

  Future<String?> upload(File file) async {
    final movieName = file.path.split("/").last;
    log(movieName);
    final movie = storageRef.child("$folder/$movieName");
    await movie.putFile(file);
    return movie.getDownloadURL();
  }
}