import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/auth/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 220,
                ),
                Text(
                  'Login to Your Account',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: TextStyle(color: AppColors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      label: Text('Email')),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: AppColors.white),
                  obscureText: isVisable,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: Icon((isVisable)
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_rounded)),
                      prefixIcon: const Icon(Icons.lock),
                      label: const Text('Password')),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.lomanda,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I havn\'t an account ',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ));
                        },
                        child: Text(
                          'Create one!',
                          style: TextStyle(color: AppColors.lomanda),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
