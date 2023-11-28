import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/app/widgets/tweet_UI.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';

class TweetScreenCompos extends StatefulWidget {
  final String? text;
  final String username;
  final String handle;
  final Image? image;
  final Image? userImage;
  final String date;
  final String time;
  final bool  followState;
  final bool verified;
  final int likeCount;
  final int retweetCount;
  final int quotesCount;
  final int viewsCount;
  final int bookmarkCount;
  const TweetScreenCompos({super.key, required this.text, required this.username, required this.handle, this.image, this.userImage, required this.date, required this.verified, required this.likeCount, required this.retweetCount, required this.quotesCount, required this.viewsCount, required this.bookmarkCount, required this.time, required this.followState});

  @override
  State<TweetScreenCompos> createState() {
    return _TweetScreenComposState();
  }
}




class _TweetScreenComposState extends State<TweetScreenCompos>{


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

  @override
  Widget build(BuildContext context) {
    final String? text = widget.text;
    final String userName = widget.username;
    final String handle = widget.handle;
    final String date = widget.date;
    final String time = widget.time;
    final bool verified = widget.verified;
    final bool followState = widget.followState;
    final Image? userImage = widget.userImage;
    final Image? image = widget.image;
    int likeCount = widget.likeCount;
    int retweetCount = widget.retweetCount;
    int quotesCount = widget.quotesCount;
    int viewsCount = widget.viewsCount;
    int bookCount = widget.bookmarkCount;
    int usernameLengh = userName.length;
    int handleLength = handle.length;
    double scaleFactor = 4.0;
    double maxTextLength = usernameLengh > handleLength
        ? usernameLengh * scaleFactor
        : handleLength * scaleFactor;
    double spaceBetweenUsernameAndButton = MediaQuery.of(context).size.width*0.35 - scaleFactor * maxTextLength;
    spaceBetweenUsernameAndButton= spaceBetweenUsernameAndButton<0?0 : spaceBetweenUsernameAndButton;
    String truncateUsername(String username) {
      if (username.length > 20) {
        return username.substring(0, 20) + '...';
      } else {
        return username;
      }
    }

    return SingleChildScrollView(
      child: Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: GestureDetector(
                  onTap: () {
                    // go to user profile
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    backgroundImage: userImage?.image,
                    radius: 22,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                // width: MediaQuery.of(context).size.width * 0.25 * maxTextLength,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(truncateUsername(userName),
                            style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold
                            )
                        ),
                        if(verified)
                          SizedBox(width: MediaQuery.of(context).size.width * 0.04,
                            child: SvgPicture.asset(AppAssets.verifiedIcon),)
                      ],
                    ),
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.00002,),
                     Text(truncateUsername(handle),
                      style: const TextStyle(
                          color: AppColors.lightGray,
                          fontSize: 13,
                          fontStyle: FontStyle.italic
                      ),
                    ),


                  ],
                ),
              ),
              Container(width: spaceBetweenUsernameAndButton),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: followState?  MaterialStateProperty.all(AppColors.whiteColor):MaterialStateProperty.all(AppColors.blackColor),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          )
                      )
                  ),

                  child: followState
                      ? const Text(
                    "Follow",
                    style: TextStyle(
                      color: AppColors.pureBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      : const Text(
                    "Following",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: AppColors.blackColor
                    ),
                  ),

                ),
                  // SizedBox(width: MediaQuery.of(context).size.width * 0.067),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor:  MaterialStateProperty.all(AppColors.pureBlack),
                        iconColor: MaterialStateProperty.all<Color?>(AppColors.lightGray),
                      ),
                      child: SvgPicture.asset(AppAssets.menuIcon,
                        height: 60,
                        width: 15,
                      ),
                    ),
                  )],
              ),
              // SizedBox(width: MediaQuery.of(context).size.width * 0.15,),

            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          if(widget.text!=null)
          Text(text!,style: const TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.normal,
          color: AppColors.whiteColor,
          ),
          ),
          if(widget.image!=null)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: widget.image!.image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
              ),
            ),
          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(" " + time + " .",style: TextStyle(color: AppColors.lightGray,fontSize: 16,fontWeight: FontWeight.w300),),
              Text(" "+ date + " . ",style: const TextStyle(color: AppColors.lightGray,fontSize: 16,fontWeight: FontWeight.w300),),
              Text(formatCount(viewsCount) + "",style: const TextStyle(color: AppColors.whiteColor,fontSize: 16),),
              const Text("Views",style: TextStyle(color: AppColors.lightGray,fontSize: 16,fontWeight: FontWeight.w300),),
            ],
          ),
           Divider(color: AppColors.lightGray.withOpacity(0.5)),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(" " + formatCount(retweetCount) + " ",style: const TextStyle(color: AppColors.whiteColor,fontSize: 16),),
              const Text("Reposts",style: TextStyle(color: AppColors.lightGray,fontSize: 16,fontWeight: FontWeight.w300),),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
              Text(formatCount(quotesCount) + " ",style: const TextStyle(color: AppColors.whiteColor,fontSize: 16),),
              const Text("Quotes",style: TextStyle(color: AppColors.lightGray,fontSize: 16,fontWeight: FontWeight.w300),),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
              Text(formatCount(likeCount) + " ",style: const TextStyle(color: AppColors.whiteColor,fontSize: 16),),
              const Text("Likes",style: TextStyle(color: AppColors.lightGray,fontSize: 16,fontWeight: FontWeight.w300),),
            ],
          ),
           Divider(color: AppColors.lightGray.withOpacity(0.5)),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(" " + formatCount(bookCount) + " ",style: const TextStyle(color: AppColors.whiteColor,fontSize: 16),),
              const Text("Bookmarks",style: TextStyle(fontSize: 16,color: AppColors.lightGray),)
            ],
          ),
           Divider(color: AppColors.lightGray.withOpacity(0.5),),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement the functionality for the first button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.pureBlack),
                        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width * 0.2, 40))
                    ),
                    child: SvgPicture.asset(
                      AppAssets.commentIcon,
                      height: 30,
                      width: 30,
                      colorFilter: const ColorFilter.mode(AppColors.lightGray, BlendMode.srcIn),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement the functionality for the second button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.pureBlack),
                        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width * 0.2, 40)),
                      iconColor: MaterialStateProperty.all<Color?>(AppColors.lightGray),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.grayRetweetIcon,
                      height: 25,
                      width: 25,
                      colorFilter: const ColorFilter.mode(AppColors.lightGray, BlendMode.srcIn),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement the functionality for the third button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.pureBlack),
                      fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width * 0.2, 40)),
                      iconColor: MaterialStateProperty.all<Color?>(AppColors.lightGray),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.likeOutlinedIcon,
                      height: 30,
                      width: 30,
                      colorFilter: const ColorFilter.mode(AppColors.lightGray, BlendMode.srcIn),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement the functionality for the fourth button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.pureBlack),
                        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width * 0.2, 40))
                    ),
                    child: SvgPicture.asset(
                      AppAssets.bookmarkIcon,
                      height: 30,
                      width: 30,
                      colorFilter: const ColorFilter.mode(AppColors.lightGray, BlendMode.srcIn),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement the functionality for the fifth button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.pureBlack),
                        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width * 0.2, 40))
                    ),
                    child: SvgPicture.asset(
                      AppAssets.shareIcon,
                      height: 25,
                      width: 25,
                      colorFilter: const ColorFilter.mode(AppColors.lightGray, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.lightGray.withOpacity(0.5),)
        ],
      ),
      )
    );
  }
}
