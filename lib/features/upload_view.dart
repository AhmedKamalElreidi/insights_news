import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/colors.dart';
import 'package:insights_news/core/loacl_data.dart';
import 'package:insights_news/features/home/home_view.dart';

String? imagePath;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  void initState() {
    super.initState();
    AppLocal.getChached(AppLocal.imageKey).then((value) {
      setState(() {
        imagePath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  //
                  AppLocal.cacheData(AppLocal.nameKey, name);
                  AppLocal.cacheBool(AppLocal.isUpload, true);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
                } else if (imagePath == null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content:
                          Text('Please Upload Image and Enter Your Name')));
                } else if (imagePath == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Upload Image')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Enter Your Name')));
                }
              },
              child: Text(
                'Done',
                style: TextStyle(color: AppColors.lomanda),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.grey,
                backgroundImage: (imagePath == null)
                    ? const AssetImage('assets/user.png')
                    : FileImage(File(imagePath!)) as ImageProvider,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  getImageFromCamera();
                },
                child: Container(
                  width: 200,
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.containerBG,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Uplaod from Camera',
                    style: TextStyle(
                        color: AppColors.lomanda, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  width: 200,
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.containerBG,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Uplaod from Gallery',
                    style: TextStyle(
                        color: AppColors.lomanda, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: AppColors.lomanda,
                ),
              ),
              TextFormField(
                cursorColor: AppColors.lomanda,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(color: AppColors.grey),
                    filled: true,
                    fillColor: AppColors.containerBG),
              )
            ],
          ),
        ),
      ),
    );
  }

  getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
