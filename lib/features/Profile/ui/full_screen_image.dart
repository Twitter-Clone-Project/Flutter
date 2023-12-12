import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

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
