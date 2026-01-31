part of '../friends_list.dart';

class FriendRequestsBanner extends StatelessWidget {
  final int count;
  final List<String> avatars;

  const FriendRequestsBanner({
    super.key,
    required this.count,
    required this.avatars,
  });

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

    return GestureDetector(
      onTap: () {
        AppRoutes.friendRequest.push(context);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.vf(10),
        decoration: BoxDecoration(
          color: AppTheme.c.primary.shade300,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppTheme.c.primary.main!, width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- Overlapping Avatars ---
            SizedBox(
              height: 21.h,
              width: 44.w,
              child: Stack(
                children: List.generate(
                  avatars.length.clamp(0, 3),
                  (i) => Positioned(
                    left: (i * 11.5).w,
                    child: CircleAvatar(
                      radius: 10.5.w,
                      backgroundColor: AppTheme.c.text.main,
                      child: CircleAvatar(
                        radius: 10.w,
                        backgroundColor: bgColors[i % bgColors.length],
                        backgroundImage: AssetImage(avatars[i]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Space.xf(10),
            // --- Text ---
            Text('$count Friend Requests', style: AppText.inter.l1bm!),
          ],
        ),
      ),
    );
  }
}
