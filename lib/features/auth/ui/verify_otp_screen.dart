// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:lottie/lottie.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
//
//
// import '../../../app/routes.dart';
// import '../../../theme/app_assets.dart';
// import '../../../theme/app_colors.dart';
// import '../../../utils/utils.dart';
// import '../data/providers/auth_provider.dart';
//
// class VerifyOtpScreen extends StatefulHookConsumerWidget{
// final String phoneNumber;
// final int temp_user_id ;
// const VerifyOtpScreen({super.key, required this.phoneNumber,required this.temp_user_id});
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => VerifyOtpScreenState();
// }
//
// class VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
//   int _resendTimer = 120 ;// Set the initial timer duration in seconds
//   late Timer _timer;
//   String otpCode='';
//
//   @override
//   void initState() {
//     otpCode="";
//     super.initState();
//     startResendTimer();
//   }
//
//   void startResendTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_resendTimer > 0) {
//           _resendTimer--;
//         } else {
//           _timer.cancel(); // Stop the timer when it reaches 0
//         }
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel(); // Cancel the timer when the widget is disposed
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final auth = ref.watch(authNotifierProvider);
//     ref.listen(authNotifierProvider.select((value) => value.errorMessage),
//             (previous, nextErrorMessage) {
//           if (nextErrorMessage != null && nextErrorMessage != '') {
//             AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
//             Future.delayed(Duration(seconds: 3), () {
//               ref.read(authNotifierProvider.notifier).resetErrorMessage();
//             });
//           }
//         });
//     return Scaffold(
//       // backgroundColor: AppColors.primaryColor, // Set the background color
//
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: <Widget>[
//               // White container with curved edges and your content
//               Positioned(
//                 top: 230, // Adjust the top position as needed
//                 left: 20, // Adjust the left position as needed
//                 right: 20, // Adjust the right position as needed
//                 child: Container(
//                   padding: EdgeInsets.only(bottom: 20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 0, left: 25, right: 25),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Lottie.asset(AppAssets.notification,width: double.infinity),
//                         Text("من فضلك أدخل الرمز المرسل إليك",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         Directionality(
//                           textDirection: TextDirection.ltr,
//                           child: OTPTextField(
//                             keyboardType: TextInputType.number,
//                             length: 6,
//                             width: MediaQuery.of(context).size.width * 0.7,
//                             fieldWidth: 40,
//                             style: TextStyle(
//                                 fontSize: 17
//                             ),
//                             textFieldAlignment: MainAxisAlignment.spaceAround,
//                             fieldStyle: FieldStyle.box,
//
//                             onCompleted: (pin) {
//                               otpCode = pin;
//                               print("Completed: " + pin);
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.04,
//                         ),
//                         auth.loading?Container(child: Center(child: const CircularProgressIndicator(color: AppColors.black,))):Container(
//                           width: MediaQuery.of(context).size.width * 0.893,
//                           height: MediaQuery.of(context).size.height * 0.068,
//                           decoration: BoxDecoration(
//                             color: Color(0xFF32343D),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child:TextButton(
//                             onPressed: () async {
//                               // Implement your "Verify OTP" functionality here
//                               // If the pin is empty then show toast
//                               if (otpCode.length<6) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     buildSnackBar(text: 'الرجاء إدخال الرمز')
//                                 );
//                               } else {
//                                 var result = await ref
//                                     .read(authNotifierProvider.notifier)
//                                     .otpVerify(
//                                   phone: widget.phoneNumber,
//                                   code: otpCode,
//                                   temp_user_id: widget.temp_user_id,
//                                 );
//                                 if(result==true) {
//                                   Navigator.pushNamedAndRemoveUntil(context, Routes.initRoute, (route) => false);
//                                 }
//                               }
//                                                      },
//                             child: const Text(
//                               'تأكيد',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             const Text(
//                               'لم تستلم الرمز؟',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: _resendTimer > 0
//                                   ? null // Disable the button when timer is active
//                                   : () {
//                                 // Implement your "Resend OTP" logic here
//                                 // Start the timer again
//                                 setState(() {
//                                   _resendTimer = 10; // Reset the timer
//                                 });
//                                 startResendTimer(); // Start the timer
//                               },
//                               child: Text(
//                                 _resendTimer > 0
//                                     ? '$_resendTimer ثانية' // Display the remaining time
//                                     : 'إعادة إرسال!',
//                                 style: TextStyle(
//                                   color: _resendTimer > 0
//                                       ? Colors.grey // Change color when timer is active
//                                       : AppColors.primaryColor,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
//
//
