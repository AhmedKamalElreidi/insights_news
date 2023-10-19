import 'package:flutter/material.dart';
import 'package:insights_news/core/colors.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Notification',
          style: TextStyle(color: AppColors.lomanda),
        ),
      ),
    );
  }
}
