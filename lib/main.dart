import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gojek_clone/modules/login_page/view/form-login.dart';
import 'package:gojek_clone/modules/main_page/view/main_page.dart';
import 'package:gojek_clone/modules/onboarding_page/view/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gojek Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => OnboardingPage()),
        GetPage(name: '/form-login', page: () => FormLoginPage()),
        GetPage(name: '/main', page: () => MainPage()),
      ],
    );
  }
}
