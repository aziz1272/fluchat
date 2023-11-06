import 'package:fluchat/src/config/routes/app_loader.dart';
import 'package:fluchat/src/config/routes/app_route.dart';
import 'package:fluchat/src/config/routes/app_toast.dart';
import 'package:fluchat/src/config/theme/app_colors.dart';
import 'package:fluchat/src/config/theme/font_theme.dart';
import 'package:fluchat/src/services/auth_services/auth_services.dart';
import 'package:fluchat/ui/pages/registration/profile_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool _obscureText = true;

  void signIn() async {
    AuthServices authServices = AuthServices();
    final password = passwordController.text.trim();
    final email = emailController.text.trim();

    showLoader(context);
    authServices.signIn(email, password).then((value) {
      Go(context).close();

      if (value) {
        showToast(context: context, message: 'Login successful!');
        Go(context).id(ProfilePage.id);
      } else {
        showToast(
            context: context,
            message:
            "Error: Email or Password entered incorrectly. Please check and try again!");
      }
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
                "Enter Your Email And Password",
                style: TextStyle(
                  fontFamily: mulish,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                height: 44,
                width: 327,
                decoration:
                    const BoxDecoration(color: AppColors.textfieldcolor),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
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
                            color: Colors.black87),
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
                          color: Colors.transparent,
                        ),
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            GestureDetector(
              onTap: signIn,
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
                      "Log in",
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
            Padding(padding: EdgeInsets.only(top: 36),
            child: RichText(
              text: TextSpan(
                  text: "Create a new account:",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Enter",
                        style: TextStyle(
                          color: AppColors.buttoncolor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, SignUpPage.id);
                          }),
                  ]),
            ),),
          ],
        ),
      ),
    );
  }
}
