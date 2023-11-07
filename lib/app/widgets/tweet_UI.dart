import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return _TweetComposeState(
        text: text,
        image: image,
        userName: username,
        likeCount: likeCount,
        handle: handle,
        date: date,
        verified: verified,
        retweetCount: retweetCount,
        commentCount: commentCount,
        userImage: userImage,
        viewsCount: viewsCount);
  }
}

class _TweetComposeState extends State<TweetCompose> {
  final String? text;
  final String userName;
  final String handle;
  final String date;
  final bool verified;
  final Image? userImage;
  final Image? image;
  int likeCount;
  int retweetCount;
  int commentCount;
  int viewsCount;
  late int likeCountBeforeMe;
  late int commentCountBeforeMe;
  late int retweetCountBeforeMe;
  late var likeIcon = AppAssets.likeOutlinedIcon;

  _TweetComposeState(
      {this.text,
        required this.userName,
        required this.date,
        required this.verified,
        required this.userImage,
        required this.handle,
        this.image,
        this.viewsCount = 0,
        this.likeCount = 0,
        this.commentCount = 0,
        this.retweetCount = 0});

  @override
  void initState() {
    super.initState();
    likeIcon = AppAssets.likeOutlinedIcon;
    likeCountBeforeMe = likeCount;
    commentCountBeforeMe = commentCount;
    retweetCountBeforeMe = retweetCount;
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
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // go to user profile
              },
              child: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                backgroundImage: userImage?.image,
                radius: 16,
              ),
            ),
            // Profile photo
            SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
            InkWell(
              onTap: () {},
              child: Text(
                userName,
                style: const TextStyle(
                  color: AppColors.blackColor,
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
            Text(
              handle,
              style: const TextStyle(color: AppColors.lightGray),
            ),
            SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
            Text(
              date,
              style: const TextStyle(color: AppColors.lightGray),
            )
          ],
        ),
        if (text != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16 * 2),
            child: Text(
              text!,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        if (text != null)
          SizedBox(
            height: 0.015 * MediaQuery.of(context).size.height,
          ),
        if (image != null)
          GestureDetector(
            onTap: () {
              _showImageDialog(context, image!);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16 * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image(
                  image: image!.image,
                  width: 0.3 * MediaQuery.of(context).size.width,
                  height: 0.45 * MediaQuery.of(context).size.height,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (commentCount == commentCountBeforeMe) {
                    commentCount += 1;
                  }
                });
              },
              icon: SvgPicture.asset(AppAssets.commentIcon),
            ),
            Text(formatCount(commentCount),
                style: const TextStyle(fontSize: 14, color: AppColors.lightGray)),
            SizedBox(width: 0.0035 * MediaQuery.of(context).size.width),
            IconButton(
              onPressed: () {
                setState(() {
                  if (retweetCount == retweetCountBeforeMe) {
                    retweetCount += 1;
                  }
                });
              },
              icon: SvgPicture.asset(AppAssets.retweetIcon),
            ),
            Text(formatCount(retweetCount),
                style: const TextStyle(fontSize: 14, color: AppColors.lightGray)),
            SizedBox(width: 0.0035 * MediaQuery.of(context).size.width),
            IconButton(
              onPressed: () {
                setState(() {
                  if (likeCount == likeCountBeforeMe) {
                    likeCount += 1; // like
                    likeIcon = AppAssets.likeFilledIcon;
                  } else {
                    likeCount -= 1; // dislike
                    likeCountBeforeMe = likeCount;
                    likeIcon = AppAssets.likeOutlinedIcon;
                  }
                });
              },
              icon: SvgPicture.asset(likeIcon),
            ),
            Text(formatCount(likeCount),
                style: const TextStyle(fontSize: 14, color: AppColors.lightGray)),
            SizedBox(
              width: 0.0035 * MediaQuery.of(context).size.width,
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppAssets.viewsIcon)),
            Text(formatCount(viewsCount),
                style: const TextStyle(fontSize: 14, color: AppColors.lightGray)),
          ],
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

void main(){
  runApp(MaterialApp(home: Scaffold(body: TweetCompose(
    verified: true,
    date: "1H",
    handle: "@mohammadAlomar",
    username: "baba",
    viewsCount: 12123,
    commentCount: 123123,
    likeCount: 1213,
    retweetCount: 123123,
    text: "freeerasdadasdasdasd",
    userImage: Image.asset("res/asstes/me5.jpg"),
  )),));
}