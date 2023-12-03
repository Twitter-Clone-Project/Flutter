import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';

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

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});
    _tabcontroller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;

    final userProfileState = ref.watch(profileNotifierProvider);
    final userProfile = userProfileState.userProfile;

    final TextEditingController _nameController =
        TextEditingController(text: userProfile.name);
    final TextEditingController _bioController =
        TextEditingController(text: userProfile.bio);
    final TextEditingController _locationController =
        TextEditingController(text: userProfile.location);
    final TextEditingController _websiteController =
        TextEditingController(text: userProfile.website);

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
        final updateProfile =
            ref.read(profileNotifierProvider.notifier).updateUserProfile;

        var result = await updateProfile(
          bannerPhoto: _bannerImage != null ? _bannerImage!.path : null,
          profilePhoto: _profileImage != null ? _profileImage!.path : null,
          bio: _bioController.text,
          website: _websiteController.text,
          location: _locationController.text,
          name: _nameController.text,
          birthDate: userProfile.birthdate,
        );
        if (result != null && result == true) {
          Navigator.pop(context);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Edit Profile", style: TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: onSubmit,
            style: TextButton.styleFrom(
              primary: Colors.white, // Set text color
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust padding as needed
            ),
            child: Text("Save", style: TextStyle(fontSize: 16)),
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
                          onTap: () {
                            _pickImage((image) {
                              setState(() {
                                _bannerImage = image;
                              });
                            });
                          },
                          child: _bannerImage != null
                              ? Image(
                                  image: FileImage(_bannerImage!),
                                  fit: BoxFit.cover,
                                )
                              : userProfile.bannerUrl != ""
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
                                    onTap: () {
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
                              decoration: InputDecoration(labelText: 'Name'),
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
                                if (value != null && value.length < 2) {
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
                                if (value != null && value.length < 2) {
                                  return "Location should contain at least 2 characters";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _websiteController,
                              decoration: InputDecoration(labelText: 'Website'),
                              validator: (value) {
                                if (value != null && value.length < 2) {
                                  return "Bio should contain at least 2 characters";
                                }
                                return null;
                              },
                              // Add controller and other properties as needed
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
}
