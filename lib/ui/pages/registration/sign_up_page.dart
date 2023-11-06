import 'package:fluchat/src/config/routes/app_loader.dart';
import 'package:fluchat/src/config/routes/app_toast.dart';
import 'package:fluchat/src/config/theme/app_colors.dart';
import 'package:fluchat/src/config/theme/font_theme.dart';
import 'package:fluchat/src/services/auth_services/auth_services.dart';
import 'package:fluchat/ui/pages/registration/profile_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../src/config/routes/app_route.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  final emailController = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextC = true;

  void signUp() async {
    AuthServices authServices = AuthServices();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final cPassword = cPasswordController.text.trim();

    if (password == cPassword) {
      showLoader(context);
      authServices.signUp(email, password).then((value) {
        Go(context).close();
        if (value) {
          showToast(context: context, message: "You have registered");
          Go(context).id(ProfilePage.id);
        } else {
          showToast(
              context: context,
              message: "You have already registered with this account");
        }
      });
    } else {
      showToast(context: context, message: "Enter the password correctly!");
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleC() {
    setState(() {
      _obscureTextC = !_obscureTextC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 169,
                left: 40,
                right: 40,
              ),
              child: Text(
                "Enter Your Username, Email And Password",
                style: TextStyle(
                  fontFamily: mulish,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 24, right: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                height: 44,
                width: 327,
                decoration: const BoxDecoration(color: Color(0xffF7F7FC)),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.red),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "mulish",
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
                decoration:
                    const BoxDecoration(color: AppColors.textfieldcolor),
                child: TextField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.iconColor),
                        onPressed: _toggle,
                      ),
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: mulish,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: const OutlineInputBorder(
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
                decoration:
                    const BoxDecoration(color: AppColors.textfieldcolor),
                child: TextField(
                  controller: cPasswordController,
                  obscureText: _obscureTextC,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                            _obscureTextC
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.iconColor),
                        onPressed: _toggleC,
                      ),
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: mulish,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.transparen,
                        ),
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            GestureDetector(
              onTap: signUp,
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
                      "Sign up",
                      style: TextStyle(
                        fontFamily: mulish,
                        color: AppColors.buttontextcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 36,
              ),
              child: RichText(
                text: TextSpan(
                  text: "Have you opened an account before? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Enter",
                      style: const TextStyle(
                        color: AppColors.buttoncolor,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Go(context).id(SignInPage.id);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
