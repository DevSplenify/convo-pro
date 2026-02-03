// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:nureo_app/configs/configs.dart';
// import 'package:nureo_app/widgets/core/headers/bottomsheet_header.dart';
// import 'package:nureo_app/widgets/design/buttons/app_button/app_button.dart';

// void showLogoutBottomSheet(BuildContext context, VoidCallback onLogout) {
//   showModalBottomSheet(
//     isScrollControlled: true,
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
//     ),
//     backgroundColor: AppTheme.c.white!,
//     builder: (BuildContext context) {
//       return Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: StatefulBuilder(
//           builder: (context, setState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).padding.bottom + 10.h,
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: AppTheme.c.white!,
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(24.r),
//                   ),
//                 ),

//                 child: SingleChildScrollView(
//                   keyboardDismissBehavior:
//                       ScrollViewKeyboardDismissBehavior.manual,
//                   padding: Space.hf(24),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Handle bar
//                       Center(
//                         child: Container(
//                           margin: EdgeInsets.only(top: 8.h),
//                           width: 38.w,
//                           height: 3.h,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFE0E0E0),
//                             borderRadius: BorderRadius.circular(2.r),
//                           ),
//                         ),
//                       ),

//                       BottomsheetHeader(title: "Do you Want Logout ? "),
//                       Space.yf(16),
//                       Text(
//                         'It will clear your current session.',
//                         style: AppText.b2!.copyWith(
//                           color: AppTheme.c.text.main,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                       // The meal list widget
//                       Space.yf(24),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: AppButton(
//                               label: 'Cancel',
//                               buttonType: ButtonType.outlined,
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           ),
//                           Space.xf(10),
//                           Expanded(
//                             child: AppButton(
//                               label: 'Yes, Logout',
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               buttonType: ButtonType.primaryWithIconLeft,
//                               iconPath: 'assets/svgs/logout.svg',
//                               iconColor: AppTheme.c.white,
//                               textColor: AppTheme.c.white,
//                               backgroundColor: AppTheme.c.accent.red,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     },
//   );
// }
