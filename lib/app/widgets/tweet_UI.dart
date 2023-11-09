import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';

import '../../theme/app_assets.dart';
import '../../theme/app_colors.dart';

class TweetCompose extends StatefulWidget {
  final String? text;
  final String username;
  final String handle;
  final Image? image;
  final Image? userImage;
  final String date;
  final bool verified;
  final int likeCount;
  final int retweetCount;
  final int commentCount;
  final int viewsCount;

  TweetCompose(
      {Key? key,
      this.text,
      required this.verified,
      required this.handle,
      required this.date,
      this.image,
      required this.userImage,
      required this.username,
      this.likeCount = 0,
      this.commentCount = 0,
      this.retweetCount = 0,
      this.viewsCount = 0})
      : super(key: key) {
    if (text == null && image == null) {
      throw ArgumentError("At least 'text' or 'image' must be provided.");
    }
  }

  @override
  State<TweetCompose> createState() {
    return _TweetComposeState();
  }
}

class _TweetComposeState extends State<TweetCompose> {
  late int likeCountBeforeMe;
  late int commentCountBeforeMe;
  late int retweetCountBeforeMe;
  late var likeIcon = AppAssets.likeOutlinedIcon;
  @override
  void initState() {
    super.initState();
    likeIcon = AppAssets.likeOutlinedIcon;
    likeCountBeforeMe = widget.likeCount;
    commentCountBeforeMe = widget.commentCount;
    retweetCountBeforeMe = widget.retweetCount;
  }

  String formatCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 1000000) {
      double kValue = count / 1000.0;
      return kValue
              .toStringAsFixed(kValue.truncateToDouble() == kValue ? 0 : 1) +
          'k';
    } else {
      double millionValue = count / 1000000.0;
      return millionValue.toStringAsFixed(
              millionValue.truncateToDouble() == millionValue ? 0 : 1) +
          'M';
    }
  }

  void _showImageDialog(BuildContext context, Image image) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: image.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? text = widget.text;
    final String userName = widget.username;
    final String handle = widget.handle;
    final String date = widget.date;
    final bool verified = widget.verified;
    final Image? userImage = widget.userImage;
    final Image? image = widget.image;
    int likeCount = widget.likeCount;
    int retweetCount = widget.retweetCount;
    int commentCount = widget.commentCount;
    int viewsCount = widget.viewsCount;

    return (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // go to user profile
          },
          child: CircleAvatar(
            backgroundColor: AppColors.whiteColor,
            backgroundImage: userImage?.image,
            radius: 20,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      userName,
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (verified)
                    SizedBox(
                      width: 0.02 * MediaQuery.of(context).size.height,
                      child: SvgPicture.asset(AppAssets.verifiedIcon),
                    ),
                  SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                  //Handle
                  Text(
                    handle,
                    style: const TextStyle(color: AppColors.lightGray),
                  ),
                  SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                  //Date
                  Text(
                    date,
                    style: const TextStyle(color: AppColors.lightGray),
                  )
                ],
              ),
              if (text != null)
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              if (image != null)
                GestureDetector(
                  onTap: () {
                    _showImageDialog(context, image);
                  },
                  child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image(
                        image: image.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    TweetIconButton(
                      pathName: AppAssets.commentIcon,
                      text: '10',
                      onTap: () {},
                    ),
                    SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                    TweetIconButton(
                      pathName: AppAssets.retweetIcon,
                      text: '10',
                      onTap: () {},
                    ),
                    SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                    TweetIconButton(
                      pathName: AppAssets.likeOutlinedIcon,
                      text: '10',
                      onTap: () {},
                    ),
                    SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                    TweetIconButton(
                        pathName: AppAssets.viewsIcon,
                        text: '1800',
                        onTap: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 0.018 * MediaQuery.of(context).size.width),
        const Divider(
          height: 1.0,
          color: AppColors.blackColor,
        )
      ],
    ));
  }
}
