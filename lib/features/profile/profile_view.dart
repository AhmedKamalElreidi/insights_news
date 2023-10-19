import 'package:flutter/material.dart';
import 'package:insights_news/core/colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(color: AppColors.lomanda),
        ),
      ),
    );
  }
}
