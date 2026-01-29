// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class UserHeader extends StatefulWidget {
//   final String userName;
//   final VoidCallback? onNotificationTap;
//   final VoidCallback? onDragTap;

//   const UserHeader({
//     super.key,
//     required this.userName,
//     this.onNotificationTap,
//     this.onDragTap,
//   });

//   @override
//   State<UserHeader> createState() => _UserHeaderState();
// }

// class _UserHeaderState extends State<UserHeader> {
//   bool get isPractitioner {
//     final role = UserRoleSingleton.role;
//     return role == UserRole.practitionerIndividual ||
//         role == UserRole.practitionerOrganization;
//   }

//   @override
//   Widget build(BuildContext context) {
//     App.init(context);

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           radius: 22.5.w,
//           backgroundImage: const AssetImage('assets/pngs/pp.png'),
//         ),

//         Space.xf(15),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Good Morning',
//                 style: AppText.b2!.copyWith(color: AppTheme.c.text.main!),
//               ),
//               Text(widget.userName, style: AppText.b1b!.w(6)),
//             ],
//           ),
//         ),

//         if (!isPractitioner) ...[
//           buildIconDisplay(
//             iconPath: 'assets/svgs/drag.svg',
//             showDot: false,
//             onTap: () {
//               if (widget.onNotificationTap != null) {
//                 widget.onDragTap!();
//               }
//             },
//           ),
//           Space.xf(8),
//         ],

//         buildIconDisplay(
//           iconPath: isPractitioner
//               ? 'assets/svgs/notification_2.svg'
//               : 'assets/svgs/notification.svg',
//           showDot: false,
//           onTap: () {
//             if (widget.onNotificationTap != null) {
//               widget.onNotificationTap!();
//             }
//           },
//         ),
//       ],
//     );
//   }
// }

// Widget buildIconDisplay({
//   required String iconPath,
//   bool showDot = false,
//   VoidCallback? onTap,
// }) {
//   return GestureDetector(
//     onTap: onTap,
//     child: CircleAvatar(
//       radius: 22.5.r,
//       backgroundColor: AppTheme.c.background.shade200,

//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: [
//           SvgPicture.asset(iconPath, width: 24.w, height: 24.h),

//           if (showDot)
//             Positioned(
//               left: 2,
//               top: -2,
//               child: Container(
//                 width: 8.w,
//                 height: 8.h,
//                 decoration: BoxDecoration(
//                   color: AppTheme.c.error.main,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     ),
//   );
// }
