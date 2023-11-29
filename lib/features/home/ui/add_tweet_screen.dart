import 'dart:io';
import 'package:path/path.dart' as path_helper;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_clone/features/home/ui/widget/rounded_button.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/app_assets.dart';
import '../data/providers/home_provider.dart';

class AddTweetScreen extends HookConsumerWidget {
  const AddTweetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController tweetController = useTextEditingController();
    final ImagePicker _imagePicker = ImagePicker();
    final _tweetImage = useState<File?>(null);

    void uploadTweetImage() async {
      var pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _tweetImage.value = File(pickedImage.path);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pureBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 30,
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          RoundedButton(
              onTap: () async {
                // Access the provider and call addTweet
                final tweetText = tweetController.text;

                String? imagePath;
                imagePath = await _getLocalPath(_tweetImage as File);

                ref.read(homeNotifierProvider.notifier).addTweet(
                  tweetText: tweetText,
                  attachments: imagePath,
                );

                Navigator.pop(context);
              },
            label: 'Post',
          )
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    //backgroundImage: Image of user,
                    radius: 20,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: TextField(
                    controller: tweetController,
                    style: AppTextStyle.textThemeDark.bodyText1!
                        .copyWith(fontSize: 22),
                    decoration: InputDecoration(
                      hintText: "What's happening?",
                      hintStyle: AppTextStyle.textThemeDark.headline6!
                          .copyWith(color: AppColors.lightThinTextGray),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              InkWell(
                onTap: () {
                  //Todo: Open List
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.lightThinTextGray,
                        width: 0.3,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: GestureDetector(
                          //onTap: onPickImages,
                          child: const Icon(
                            Icons.public,
                            size: 15,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          'Everyone can reply',
                          style: AppTextStyle.textThemeDark.subtitle1!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.lightThinTextGray,
                      width: 0.3,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: GestureDetector(
                        onTap: uploadTweetImage,
                        child: SvgPicture.asset(
                          AppAssets.galleryIcon,
                          height: 25,
                          width: 25,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppAssets.gifIcon,
                          height: 30,
                          width: 30,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppAssets.listIcon,
                          height: 23,
                          width: 23,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppAssets.locationIcon,
                          height: 27,
                          width: 27,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
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
    );
  }

  Future<String?> _getLocalPath(File imageFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = path_helper.basename(imageFile.path);
      final localPath = appDir.path + '/' + fileName;
      await imageFile.copy(localPath);
      return localPath;
    } catch (e) {
      print("Error getting local path: $e");
      return null;
    }
  }

}
