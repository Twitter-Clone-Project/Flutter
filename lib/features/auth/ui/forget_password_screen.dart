// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../../app/widgets/text_field.dart';
// import '../../../theme/app_assets.dart';
// import '../../../theme/app_colors.dart';
//
// class ForgetPasswordScreen extends StatefulHookConsumerWidget {
//   const ForgetPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<ForgetPasswordScreen> createState() =>
//       _ForgetPasswordScreenState();
// }
//
// class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       extendBodyBehindAppBar: true,// Set the background color
//       body: Stack(
//         children: <Widget>[
//           Positioned(
//             top: -90,
//             child: Transform.rotate(
//               angle:
//                   350 * 3.1415926535 / 180, // Rotate by 45 degrees (in radians)
//               child: Opacity(
//                 opacity: 1, // 35% opacity
//                 child: Image.asset(
//                   AppAssets.loginBg,
//                   fit: BoxFit.cover,
//                   width: MediaQuery.of(context).size.width *
//                       1.2, // Set to screen width
//                   // height: MediaQuery.of(context).size.height, // Set to screen height
//                 ),
//               ),
//             ),
//           ),
//           // Centered logo at the top of the page
//           Positioned(
//             top: MediaQuery.of(context).size.height *
//                 0.15, // Adjust the top position as needed
//             left: 0,
//             right: 0,
//             child: Center(
//               child: Opacity(
//                 opacity: 1.0, // 100% opacity
//                 child: Image.asset(
//                   AppAssets.recLogo,
//                   width: MediaQuery.of(context).size.width *
//                       0.5, // Adjust the size as needed
//                 ),
//               ),
//             ),
//           ),
//           // White container with curved edges and your content
//           Positioned(
//             top: 230, // Adjust the top position as needed
//             left: 20, // Adjust the left position as needed
//             right: 20, // Adjust the right position as needed
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               // physics: const NeverScrollableScrollPhysics(),
//               // padding:
//               //     EdgeInsets.symmetric(horizontal: 20, vertical: MediaQuery.of(context).size.height* 0.06),
//               children: [
//                 Stack(children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.99),
//                       borderRadius: BorderRadius.circular(29),
//                     ),
//
//                     width: MediaQuery.of(context).size.width * 0.89,
//                     // color: Colors.red,
//                     height: MediaQuery.of(context).size.height * 0.55,
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only( left: 25, right: 25),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.04,
//                         ),
//                         Center(
//                           child: Image.asset(
//                             AppAssets.mail,
//                             scale: 1.1,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.05,
//                         ),
//                         const Center(
//                           child: Text(
//                             'من فضلك فقم بإدخال رقم الجوال الخاص بك',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                                 color: Color(0xff434858)),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         AppTextField(
//                             hintText: 'رقم الجوال',
//                             hintStyle: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14,
//                                 color: Color(0xff7C7C7C)),
//                             suffixIcon: Image.asset(
//                               AppAssets.saFlag,
//                               width: 10,
//                             ),
//                             color: Colors.transparent,
//                             textInputType: TextInputType.phone),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.893,
//                           height:
//                               MediaQuery.of(context).size.height * 0.068,
//                           decoration: BoxDecoration(
//                             color: Color(0xFF32343D),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: TextButton(
//                             onPressed: () async {},
//                             child: const Text(
//                               'تأكيد',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
