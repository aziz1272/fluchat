import 'package:fluchat/main.dart';
import 'package:fluchat/src/config/theme/app_colors.dart';
import 'package:fluchat/src/config/theme/font_theme.dart';
import 'package:fluchat/src/services/auth_services/auth_services.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact",
          style: TextStyle(
            color: Color(0xff0F1828),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.pushReplacementNamed(context, HomePage.id);
            },
            icon: const Icon(
              Icons.add,
              color: Color(0xff0F1828),
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              AuthServices().logout().then((value) {
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CheckUser(),
                  ),
                  ModalRoute.withName('/'),
                );
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
              child: Container(
                height: 36,
                width: 327,
                decoration: const BoxDecoration(color: AppColors.textfieldcolor),
                child: const TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,color: Colors.grey,
                      ),
                      floatingLabelStyle: TextStyle(color: Colors.red),
                      hintText: "Search",
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
          ],
        ),
      ),
    );
  }
}
