import 'package:fluchat/ui/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
            Navigator.pushReplacementNamed(context, SignInPage.id);
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
                "Enter Your Username, Email And Password",
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
                      hintText: "Enter Username",
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
              padding: const EdgeInsets.only(top: 18, left: 24, right: 24),
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
                "Sign up",
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
