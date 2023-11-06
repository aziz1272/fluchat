import 'package:fluchat/ui/pages/registration/sign_in_page.dart';
import 'package:flutter/material.dart';

import '../../../src/config/theme/font_theme.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splash_page';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 62, right: 51, top: 105),
              child: Container(
                height: 271,
                width: 262,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Illustration.png"),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 47, top: 42, right: 48),
              child: Text(
                "Connect easily with  your family and friends over countries",
                style: TextStyle(
                  color: Color(0xff0F1828),
                  fontFamily: mulish,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 106),
              child: Text(
                'Terms & Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff0F1828),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: mulish,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, SignInPage.id);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
                child: Container(
                  height: 52,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff002DE3),
                  ),
                  child: const Center(
                    child: Text(
                      'Start Messaging',
                      style: TextStyle(
                        color: Color(0xffF7F7FC),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}