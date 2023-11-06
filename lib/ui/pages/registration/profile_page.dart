import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluchat/src/config/routes/app_loader.dart';
import 'package:fluchat/src/config/theme/app_colors.dart';
import 'package:fluchat/src/config/theme/font_theme.dart';
import 'package:fluchat/src/services/local_database/local_db_services.dart';
import 'package:fluchat/ui/pages/bottom_navigation_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../src/config/routes/app_route.dart';
import '../../../src/config/utils/app_id_generator.dart';
import '../../../src/models/user_model.dart';
import '../../../src/services/firebase_storage_services/firebase_storage.dart';
import '../../../src/services/real_db_services/real_time_database.dart';


class ProfilePage extends StatefulWidget {
  static const String id = "profile_page";

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  LocalDb localDb = LocalDb();
  final imagePicker = ImagePicker();
  final name = TextEditingController();
  final surname = TextEditingController();
  final userName = TextEditingController();
  final bio = TextEditingController();
  String path = "";

  void pickImage() async {
    await imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        path = value.path;
      }
    });
  }

  void addToDatabase() async {
    showLoader(context);
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final userID = firebaseAuth.currentUser!.uid;
    RealDatabaseServices databaseServices = RealDatabaseServices();
    FirebaseStorageServices storageServices = FirebaseStorageServices();
    final imageUrl = await storageServices.upload(File(path));
    UserModel userModel = UserModel(
      id: userID,
      name: name.text.trim(),
      surname: surname.text.trim(),
      photoUrl: imageUrl ?? "",
      username: userName.text.trim(),
      bio: bio.text.trim(),
      lastEnteredToApp: Token.now(),
      online: true,
    );
    databaseServices.add(userModel).then((value) {
      Go(context).close();
      Navigator.pushReplacementNamed(context, BottomBar.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Profile",
          style: TextStyle(
            fontSize: 18,
            fontFamily: mulish,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: pickImage,
            child: Container(
              margin: const EdgeInsets.only(top: 41, left: 134, right: 141),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.textfieldcolor,
                borderRadius: BorderRadius.circular(60),
                image: path.isNotEmpty
                    ? DecorationImage(
                        image: FileImage(File(path)), fit: BoxFit.cover)
                    : null,
              ),
              child: path.isEmpty
                  ? const Icon(
                      Icons.image_outlined,
                      size: 32,
                      color: Colors.black,
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              height: 44,
              width: 327,
              decoration: const BoxDecoration(color: AppColors.textfieldcolor),
              child: TextField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    //floatingLabelStyle: TextStyle(color: Colors.red),
                    hintText: "Entered Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: mulish,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.transparen,
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              height: 44,
              width: 327,
              decoration: const BoxDecoration(color: AppColors.textfieldcolor),
              child: TextField(
                controller: surname,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.red),
                    hintText: "Entered Last Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: mulish,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              height: 44,
              width: 327,
              decoration: const BoxDecoration(color: AppColors.textfieldcolor),
              child: TextField(
                controller: userName,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.red),
                    hintText: "Entered Username",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: mulish,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              height: 44,
              width: 327,
              decoration: const BoxDecoration(color: AppColors.textfieldcolor),
              child: TextField(
                controller: bio,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.red),
                    hintText: "Entered bio",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: mulish,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              addToDatabase();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
              child: Container(
                height: 52,
                width: 327,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.buttoncolor),
                child: const Center(
                  child: Text(
                    "Enter",
                    style: TextStyle(
                      color: AppColors.buttontextcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: mulish,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
