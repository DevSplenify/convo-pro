import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendRequestContainer extends StatelessWidget {
  final String name;
  final int streakCount;
  final String avatarUrl;
  final VoidCallback onTapAccept;
  final VoidCallback onTapDecline;

  static int _colorIndex = 0;

  FriendRequestContainer({
    super.key,
    required this.name,
    required this.streakCount,
    required this.avatarUrl,
    required this.onTapAccept,
    required this.onTapDecline,
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

    return Container(
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
          Text(
            name,
            style: AppText.inter.b2!.w(6),
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: onTapAccept,
                child: Container(
                  padding: Space.all(10, 4),
                  decoration: BoxDecoration(
                    color: AppTheme.c.accent.purple!,
                    borderRadius: BorderRadius.circular(40.r),
                    boxShadow: UIProps.cardShadow,
                  ),
                  child: Text('Accept', style: AppText.inter.l1bm!),
                ),
              ),
              Space.xf(6),
              GestureDetector(
                onTap: onTapDecline,
                child: Container(
                  padding: Space.all(10, 4),
                  decoration: BoxDecoration(
                    color: AppTheme.c.background.shade200!,
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.all(
                      color: AppTheme.c.accent.purple!,
                      width: 1.w,
                    ),
                    boxShadow: UIProps.cardShadow,
                  ),
                  child: Text('Decline', style: AppText.inter.l1bm!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
