import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/auth/login_view.dart';
import 'package:insights_news/features/upload/upload_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 220,
                  ),
                  Text(
                    'Create a new Account',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Name must not be empty!';
                  //     }
                  //     return null;
                  //   },
                  //   style: TextStyle(color: AppColors.white),
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: const InputDecoration(
                  //       prefixIcon: Icon(Icons.person), label: Text('Name')),
                  // ),
                  // const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty!';
                      }
                      return null;
                    },
                    style: TextStyle(color: AppColors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        label: Text('Email')),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty!';
                      }
                      return null;
                    },
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
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //   builder: (context) => const HomeView(),
                        // ));

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const UploadView(),
                          //  (value ?? false) ? const HomeView() : const UploadView(),
                        ));
                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.lomanda,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text('Sign Up'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I have an account ',
                        style: TextStyle(color: AppColors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                          },
                          child: Text(
                            'Login!',
                            style: TextStyle(color: AppColors.lomanda),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
