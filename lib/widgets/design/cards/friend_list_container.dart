import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendListContainer extends StatelessWidget {
  final String name;
  final int streakCount;
  final String avatarUrl;
  final VoidCallback onTap;

  static int _colorIndex = 0;

  FriendListContainer({
    super.key,
    required this.name,
    required this.streakCount,
    required this.avatarUrl,
    required this.onTap,
  }) {
    _colorIndex++;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final bgColors = [
      const Color(0xFF374151), // gray
      const Color(0xFFA5A7FE), // lavender
      const Color(0xFFFF8A76), // coral
      const Color(0xFFFFC85C), // yellow
      const Color(0xFF64D2FF), // cyan
    ];

    // Use modulo to keep cycling
    final backgroundColor = bgColors[_colorIndex % bgColors.length];

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.c.background.shade200,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: backgroundColor,
              backgroundImage: AssetImage(avatarUrl),
            ),
            Space.xf(15),
            Expanded(
              child: Text(
                name,
                style: AppText.inter.b2!.w(6),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'View Profile',
              style: AppText.inter.l1bm!.copyWith(
                color: AppTheme.c.text.main!,
                decoration: TextDecoration.underline,
                decorationColor: AppTheme.c.text.main!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
