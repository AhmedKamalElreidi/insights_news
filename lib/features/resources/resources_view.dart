import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List img = [
    "bbc",
    "biensports",
    "cnn",
    "espn",
    "sky",
    "kora",
    "science",
    "skysports",
    "yalla"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: (2 / 2),
            children: [
          for (int i = 0; i < img.length; i++)
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xff212325),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset("assets/${img[i]}.png",
                          width: 120, height: 120, fit: BoxFit.contain),
                    ),
                  ),
                ]))
        ]));
  }
}
