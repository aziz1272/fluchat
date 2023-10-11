import 'package:fluchat/ui/pages/sign_in_up_pages/sign_up_page.dart';
import 'package:fluchat/ui/pages/splash_pages/splash_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SplashPage.id);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff0F1828),
            size: 24,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 79,
                left: 40,
                right: 40,
              ),
              child: Text(
                "Enter Your Email And Password",
                style: TextStyle(
                  fontFamily: "mulish",
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
                decoration: const BoxDecoration(color: Color(0xffF7F7FC)),
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
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
                decoration: const BoxDecoration(color: Color(0xffF7F7FC)),
                child: TextField(
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
                      floatingLabelStyle: const TextStyle(color: Colors.red),
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: "mulish",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24,top: 36),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, SignUpPage.id);
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xff002DE3),
                        fontWeight: FontWeight.w600,
                        fontFamily: "mulish",
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
          child: Container(
            height: 52,
            width: 327,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff002DE3)),
            child: const Center(
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Color(0xffF7F7FC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
