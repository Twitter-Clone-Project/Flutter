import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';
import 'package:x_clone/theme/app_colors.dart';

class EditProfileScreen extends StatefulHookConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;

  File? _profileImage;
  File? _bannerImage;
  DateTime? _selectedDate;
  late bool removeBannerPicture;

  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _locationController;
  late TextEditingController _websiteController;
  late TextEditingController _dateOfBirthController;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});

    var userProfile = ref.read(profileNotifierProvider).userProfile;

    _nameController = TextEditingController(text: userProfile.name ?? "");
    _bioController = TextEditingController(text: userProfile.bio ?? "");
    _locationController =
        TextEditingController(text: userProfile.location ?? "");
    _websiteController = TextEditingController(text: userProfile.website ?? "");
    _dateOfBirthController =
        TextEditingController(text: userProfile.birthDate ?? "");

    removeBannerPicture = false;

    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale('en', 'US'),
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      _dateOfBirthController.text =
          DateFormat('yyyy-MM-dd').format(_selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;

    var userProfile = ref.watch(profileNotifierProvider).userProfile;

    bool isLoading = ref.watch(profileNotifierProvider).loading;

    Future<void> _pickImage(Function(File) setImage) async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setImage(File(pickedFile.path));
      }
    }

    void onSubmit() async {
      if (AppKeys.updateProfileFormKey.currentState!.validate()) {
        var result = await ref
            .read(profileNotifierProvider.notifier)
            .updateUserProfile(
                bannerPhoto: _bannerImage != null ? _bannerImage!.path : null,
                profilePhoto:
                    _profileImage != null ? _profileImage!.path : null,
                bio: _bioController.text,
                website: _websiteController.text,
                location: _locationController.text,
                name: _nameController.text,
                birthDate: _dateOfBirthController.text,
                removeBannerPhoto: removeBannerPicture);
        ref.read(authNotifierProvider.notifier).updateUser(
              name: result?.name,
              profileImageURL: result?.imageUrl,
            );
        // ref.read(authNotif)

        if (result != null) {
          Navigator.pop(context);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            fontFamily: 'Chirp',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: AppColors.whiteColor, thickness: 0.1),
        ),
        actions: [
          Container(
            child: CustomButton(text: "Save", onPressed: onSubmit, filled: false,
            horizontalPadding: 25,
            verticalPadding: 1,),
          ),

        ],
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: AppKeys.updateProfileFormKey,
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: mediaQuery.size.width,
                        height: backgroundImageHeight,
                        child: GestureDetector(
                          onTap: () async {
                            String updateBanner = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: AppColors.blackColor,
                                  title: Text(
                                    'Banner Photo',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Chirp',
                                      // Use the font family name specified in pubspec.yaml
                                      color: Colors
                                          .white, // Set the text color to white
                                    ),
                                  ),
                                  content: const CustomText(
                                    'Do you want to add or remove the banner photo?',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(
                                            "cancel"); // User canceled unblock
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontFamily:
                                              'Chirp', // Use the font family name specified in pubspec.yaml
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: userProfile.bannerUrl !=
                                          "https://kady-twitter-images.s3.amazonaws.com/DefaultBanner.png",
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(
                                              "remove"); // User confirmed unblock
                                        },
                                        child: const Text(
                                          'Remove',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontFamily:
                                                'Chirp', // Use the font family name specified in pubspec.yaml
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(
                                            "update"); // User confirmed unblock
                                      },
                                      child: const Text(
                                        'update',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontFamily:
                                              'Chirp', // Use the font family name specified in pubspec.yaml
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (updateBanner == "update") {
                              _pickImage((image) {
                                setState(() {
                                  _bannerImage = image;
                                });
                              });
                              setState(() {
                                removeBannerPicture = false;
                              });
                            } else if (updateBanner == "remove") {
                              setState(() {
                                removeBannerPicture = true;
                              });
                            }
                          },
                          child: _bannerImage != null
                              ? Image(
                                  image: FileImage(_bannerImage!),
                                  fit: BoxFit.cover,
                                )
                              : userProfile.bannerUrl != "" &&
                                      !removeBannerPicture
                                  ? Image(
                                      image:
                                          NetworkImage(userProfile.bannerUrl))
                                  : Container(
                                      color: Color(0xFF333639),
                                    ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: backgroundImageHeight -
                                profileImageDiameter / 2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width:
                                        2.0, // Adjust the border width as needed
                                  ),
                                ),
                                child: GestureDetector(
                                    onTap: () async {
                                      _pickImage((image) {
                                        setState(() {
                                          _profileImage = image;
                                        });
                                      });
                                    },
                                    child: ClipOval(
                                      child: CircleAvatar(
                                        radius: profileImageDiameter / 2,
                                        child: _profileImage != null
                                            ? Image(
                                                image:
                                                    FileImage(_profileImage!),
                                                fit: BoxFit.cover)
                                            : userProfile.bannerUrl != ""
                                                ? Image(
                                                    image: NetworkImage(
                                                        userProfile.imageUrl!))
                                                : Container(
                                                    color: Color(0xFF333639),
                                                  ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name cannot be empty";
                                } else if (value.length < 2) {
                                  return "Name should contain at least 2 characters";
                                } else if (RegExp(r'\d').hasMatch(value)) {
                                  return "Name cannot contain numbers";
                                }
                                return null;
                              },
                              // Add controller and other properties as needed
                            ),
                            TextFormField(
                              controller: _bioController,
                              decoration: InputDecoration(labelText: 'Bio'),
                              validator: (value) {
                                if (value != null) return null;
                                if (value!.length == 0) {
                                  return null;
                                }
                                if (value.length < 2) {
                                  return "Bio should contain at least 2 characters";
                                }
                                return null;
                              },
                              // Add controller and other properties as needed
                            ),
                            TextFormField(
                              controller: _locationController,
                              decoration:
                                  InputDecoration(labelText: 'Location'),
                              validator: (value) {
                                if (value != null) return null;
                                if (value!.length == 0) {
                                  return null;
                                }
                                if (value.length < 2) {
                                  return "Location should contain at least 2 characters";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _websiteController,
                              decoration: InputDecoration(labelText: 'Website'),
                              validator: (value) {
                                if (value != null) return null;
                                if (value!.length == 0) {
                                  return null;
                                }
                                if (value.length < 2) {
                                  return "website should contain at least 2 characters";
                                }
                                return null;
                              },
                              // Add controller and other properties as needed
                            ),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _dateOfBirthController,
                                  decoration: InputDecoration(
                                      labelText: 'Date of Birth'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Date of birth cannot be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _websiteController.dispose();
    _dateOfBirthController.dispose();
  }
}
