import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/home/ui/widget/rounded_button.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// A screen widget for adding a new tweet.
///
/// This widget allows the user to compose a new tweet by entering text and attaching images.
/// It provides a text input field for the tweet text and a button to post the tweet.
/// The user can also attach up to 4 images to the tweet.
class AddTweetScreen extends StatefulHookConsumerWidget {
  const AddTweetScreen({super.key});

  @override
  ConsumerState<AddTweetScreen> createState() => _AddTweetScreenState();
}

class _AddTweetScreenState extends ConsumerState<AddTweetScreen> {
  TextEditingController _tweetTextController = TextEditingController();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _tweetTextController;
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _tweetTextController.dispose();
    super.dispose();
  }

  List<File> imgs = [];

  /// Opens the image picker to select multiple images.
  ///
  /// This function uses the [ImagePicker] package to allow the user to pick multiple images from their device.
  /// It returns a list of [File] objects representing the selected images.
  Future<List<File>> pickImages() async {
    List<File> attachments = [];
    final ImagePicker picker = ImagePicker();
    final imageFiles = await picker.pickMultiImage();
    if (imageFiles.isNotEmpty) {
      int currentAttachmentsCount = attachments.length;
      int remainingSlots = 4 - currentAttachmentsCount;
      for (int i = 0; i < imageFiles.length && i < remainingSlots; i++) {
        attachments.add(File(imageFiles[i].path));
      }
    }
    return attachments;
  }

  /// Callback function for picking images.
  ///
  /// This function is called when the user taps on the attach images button.
  /// It calls the [pickImages] function to open the image picker and update the [imgs] list with the selected images.
  void onPickImages() async {
    imgs = await pickImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: CustomButton(
              onPressed: () async {
                List<MultipartFile> multipartimgs = [];
                for (var file in imgs) {
                  MultipartFile multipartFile = await MultipartFile.fromFile(
                    file.path,
                  );
                  multipartimgs.add(multipartFile);
                }
                String trimmedText = _tweetTextController.text.trim();
                if (trimmedText.isNotEmpty &&
                    _tweetTextController.text.length < 280) {
                  ref.read(profileNotifierProvider.notifier).addTweet(
                      tweetText: trimmedText, attachments: multipartimgs);
                  Navigator.pop(context);
                }
              },
              text: 'Post',
              horizontalPadding: 14,
              disabled: (_tweetTextController.text.trim().isNotEmpty &&
                  _tweetTextController.text.length < 280)? false: true,
              filled: (_tweetTextController.text.trim().isNotEmpty &&
                  _tweetTextController.text.length < 280)? true: false,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            imageUrl: ref
                                .watch(authNotifierProvider)
                                .user!
                                .imageUrl ??
                                '',
                            placeholder: (context, url) => Image.asset(
                                AppAssets.whiteLogo,
                                fit: BoxFit.cover),
                            errorWidget: (context, url, error) => Image.asset(
                                AppAssets.whiteLogo,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _tweetTextController,
                            style: AppTextStyle.textThemeDark.bodyText1!
                                .copyWith(fontSize: 22),
                            decoration: InputDecoration(
                              hintText: "What's happening?",
                              hintStyle: AppTextStyle.textThemeDark.headline6!
                                  .copyWith(color: AppColors.lightThinTextGray),
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                            onChanged: (_) {
                              setState(() {});
                            },
                          ),
                          if (imgs.isNotEmpty)
                            CarouselSlider(
                              items: imgs.map(
                                (file) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Image.file(file));
                                },
                              ).toList(),
                              options: CarouselOptions(
                                height: 400,
                                enableInfiniteScroll: false,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                            child: SvgPicture.asset(
                              AppAssets.earthIcon,
                              height: 15,
                              width: 15,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn),
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
                            style:
                                AppTextStyle.textThemeDark.subtitle1!.copyWith(
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
                          onTap: onPickImages,
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
                      const Spacer(),
                      280 - _tweetTextController.text.length > -10
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, top: 15, right: 10),
                              child: CircularPercentIndicator(
                                radius: 15,
                                lineWidth: 3,
                                backgroundColor:
                                    const Color.fromARGB(255, 52, 58, 62),
                                progressColor: _tweetTextController
                                            .text.length >
                                        280
                                    ? Colors.red
                                    : 280 - _tweetTextController.text.length <=
                                            20
                                        ? Colors.orange
                                        : AppColors.primaryColor,
                                percent: _tweetTextController.text.length < 281
                                    ? _tweetTextController.text.length / 280
                                    : 1,
                                center: 280 - _tweetTextController.text.length <
                                        0
                                    ? Text(
                                        "${280 - _tweetTextController.text.length}",
                                        style: AppTextStyle
                                            .textThemeDark.bodyMedium!
                                            .copyWith(color: Colors.red),
                                      )
                                    : 280 - _tweetTextController.text.length <=
                                            20
                                        ? Text(
                                            "${280 - _tweetTextController.text.length}",
                                            style: AppTextStyle
                                                .textThemeDark.bodyMedium!
                                                .copyWith(
                                                    color: AppColors
                                                        .lightThinTextGray),
                                          )
                                        : null,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, top: 15, right: 12),
                              child: Text(
                                "${280 - _tweetTextController.text.length}",
                                style: AppTextStyle.textThemeDark.bodyMedium!
                                    .copyWith(color: Colors.red),
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
}
