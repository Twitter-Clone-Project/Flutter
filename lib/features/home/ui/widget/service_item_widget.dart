// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:x_clone/features/home/data/models/home_response.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../app/routes.dart';
// import '../../../../theme/app_assets.dart';
// import '../../../../theme/app_colors.dart';
//
// class ServiceItem extends StatelessWidget {
//   final Service service;
//
//   const ServiceItem(this.service, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, Routes.serviceFormScreen,
//             arguments: service);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(5),
//         child: Card(
//           elevation: 2,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Container(
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(10),
//     border: Border.all(
//     color: Colors.grey, // Change this to the desired border color
//     width: 1, // Adjust the width as needed
//     ),),
//             child: Stack(
//               children: <Widget>[
//                 // Image in top-left corner
//                 Positioned(
//                   top: MediaQuery.of(context).size.height * 0.01,
//                   left: MediaQuery.of(context).size.height * 0.01,
//                   child: CachedNetworkImage(
//                     height: MediaQuery.of(context).size.height * 0.05,
//                     width: MediaQuery.of(context).size.height * 0.05,
//                     fit: BoxFit.scaleDown ,
//                     color: AppColors.grayDark,
//                     imageUrl: "${service?.icon?.url}",
//                     placeholder: (context, url) =>
//                         Image.asset(AppAssets.logo, fit: BoxFit.cover),
//                     errorWidget: (context, url, error) =>
//                         Image.asset(AppAssets.logo, fit: BoxFit.cover),
//                   ),
//                 ),
//                 // Text in bottom-right corner
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Container(
//                     margin: const EdgeInsets.all(8.0),
//                     color: Colors.white, // Optional: Add a background color
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 2,
//                           height: 18,
//                           color: Colors.black,
//                         ),
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         Text(
//                           service.name ?? "",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
