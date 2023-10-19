import 'package:flutter/material.dart';
import 'package:insights_news/core/colors.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'News',
          style: TextStyle(color: AppColors.lomanda),
        ),
      ),
    );
  }
}
