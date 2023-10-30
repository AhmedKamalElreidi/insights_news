import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/colors.dart';
import 'package:insights_news/core/loacl_data.dart';

String? imagePath;
String name = '';
bool nameCached = true;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  showModelSheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(22),
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  getImageFrom(ImageSource.camera);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "from camera",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  getImageFrom(ImageSource.gallery);
                },
                // uploadImage2screen(ImageSource.gallery);

                child: const Row(
                  children: [
                    Icon(
                      Icons.photo_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "From Gallery",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  getImageFrom(ImageSource type) async {
    final pickedImage = await ImagePicker().pickImage(source: type);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var textCon;
  @override
  void initState() {
    super.initState();
    AppLocal.getChached(AppLocal.nameKey).then((value) {
      setState(() {
        name = value;
      });
    });
    textCon = TextEditingController(text: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: AppLocal.getChached(AppLocal.imageKey),
              builder: (context, snapshot) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(128, 78, 91, 110)),
                  child: Stack(children: [
                    snapshot.data == null
                        ? const CircleAvatar(
                            radius: 62,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage("assets/user.png"),
                            ),
                          )
                        : CircleAvatar(
                            radius: 62,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(File(snapshot.data!)),
                            ),
                          ),
                    Positioned(
                      bottom: -15,
                      right: -10,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            showModelSheet();
                          });
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ]),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Divider(
              color: AppColors.lomanda,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: nameCached
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          nameCached = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.containerBG,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17)),
                      ),
                    )
                  : TextFormField(
                      controller: textCon,
                      //دى هستخدمها  لو مش هعمل توجل بين الكونتينر و التيكست فيلد   بى الكاش نيم  دى هخزن القيمة جوه التيكست فيلد عادى
                      // onFieldSubmitted: (value) {
                      //   if (name.isNotEmpty) {
                      //     setState(() {
                      //       AppLocal.cacheData(AppLocal.nameKey, name);
                      //     });
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //         backgroundColor: Colors.red,
                      //         content: Text('Please Enter Your Name')));
                      //   }
                      // },
                      cursorColor: AppColors.lomanda,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                          AppLocal.cacheData(AppLocal.nameKey, name);
                        });
                      },
                      style: TextStyle(color: AppColors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide()),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide()),
                          hintText: 'Enter Your Name',
                          hintStyle: TextStyle(color: AppColors.grey),
                          filled: true,
                          fillColor: AppColors.containerBG),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
