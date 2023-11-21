import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/storage/loacl_data.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/home/home_view.dart';

String? _Image;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  var textCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (_Image != null && name.isNotEmpty) {
                  AppLocal.cacheData(AppLocal.IS_UPLOAD, true);
                  AppLocal.cacheData(AppLocal.Name_Key, name);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
                } else if (_Image == null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redColor,
                      content: const Text(
                          'Please Upload Your Image and Enter Your Name')));
                } else if (_Image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redColor,
                      content: const Text('Please Upload Your Image')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redColor,
                      content: const Text('Please Enter your Name')));
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
                radius: 61,
                backgroundColor: AppColors.lomanda,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.primaryColor,
                  foregroundImage: (_Image != null)
                      ? FileImage(File(_Image!)) as ImageProvider
                      : const AssetImage(
                          'assets/avatar.png',
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await getImagefromCamera();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lomanda),
                  child: Text(
                    'Upload from Camera',
                    style: TextStyle(color: AppColors.lightBg),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await getImagefromGallery();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lomanda),
                  child: Text(
                    'Upload from Gallery',
                    style: TextStyle(color: AppColors.lightBg),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  color: AppColors.grey,
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                style: TextStyle(color: AppColors.lomanda),
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(color: AppColors.lomanda),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getImagefromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.Image_Key, pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }

  getImagefromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.Image_Key, pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }
}
