import 'package:flutter/material.dart';
import 'package:insights_news/core/colors.dart';
import 'package:insights_news/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          iconTheme: IconThemeData(color: AppColors.grey),
          scaffoldBackgroundColor: AppColors.sacffoldBG,
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: AppColors.lomanda,
            labelStyle: TextStyle(color: AppColors.grey),
            prefixIconColor: AppColors.lomanda,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.lomanda)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.lomanda)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
          )),
      home: const SplashView(),
    );
  }
}
