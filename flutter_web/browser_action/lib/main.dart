import 'package:browser_action/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // getPages: [
      //   GetPage(
      //     name: Routes.HOME,
      //     page: () => Home(),
      //   ),
      //   GetPage(
      //     name: Routes.LOGIN,
      //     page: () => Login(),
      //   ),
      //   GetPage(
      //     name: Routes.SIGNUP,
      //     page: () => Signup(),
      //   ),
      // ],
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
