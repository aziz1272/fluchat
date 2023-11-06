import 'package:firebase_core/firebase_core.dart';
import 'package:fluchat/ui/pages/bottom_navigation_bar/bottom_bar.dart';
import 'package:fluchat/ui/pages/registration/profile_page.dart';
import 'package:fluchat/ui/pages/splash_pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/services/auth_services/auth_services.dart';
import 'src/services/local_database/local_db_services.dart';
import 'ui/pages/registration/sign_in_page.dart';
import 'ui/pages/registration/sign_up_page.dart';

Future<void> main() async{
  LocalDb local = LocalDb();
  await Hive.initFlutter();
  await Hive.openBox(local.boxName);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      routes: {
        SplashPage.id:(context) => const SplashPage(),
        SignInPage.id:(context) => const SignInPage(),
        SignUpPage.id:(context) => const SignUpPage(),
        BottomBar.id:(context) => BottomBar(initialIndex: 0),
        ProfilePage.id:(context) => const ProfilePage(),
      },
    );
  }
}

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices().getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
            ),
          );
        } else {
          if (snapshot.data == null) {
            return const SplashPage();
          } else {
            return BottomBar(initialIndex: 0);
          }
        }
      },
    );
  }
}
