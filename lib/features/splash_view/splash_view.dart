import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/auth/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // AppLocal.getData(AppLocal.IS_UPLOAD).then((value) {
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) =>
      //    (value ?? false) ? const HomeView() : const UploadView(),
      //   ));
      // });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sacffoldBG,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 250,
          ),
          // Lottie.asset(
          //   'assets/news.json',
          //   height: 250,
          // ),
          Text(
            'Insight News',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
        ],
      )),
    );
  }
}
