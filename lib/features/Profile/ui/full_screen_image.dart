import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

/// A widget that displays an image in full screen.
///
/// This widget takes an [imageUrl] as a required parameter and displays the image in full screen.
/// It provides a back button in the app bar to navigate back to the previous screen.
class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          onPressed: () =>
              Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent, // Set app bar background to transparent
        iconTheme: IconThemeData(color: Colors.white), // Set back button color to white
        elevation: 0, // Remove app bar shadow
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
