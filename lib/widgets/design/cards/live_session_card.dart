import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveSessionCard extends StatelessWidget {
  final String imagePath;
  final String sessionBy;
  final String sessionDateTime;
  final int? joinedCount;

  const LiveSessionCard({
    super.key,
    required this.imagePath,
    required this.sessionBy,
    required this.sessionDateTime,
    this.joinedCount = 25,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.buttonRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              imagePath,
              height: 315.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Space.yf(13.5),
          Text("Live Session by $sessionBy", style: AppText.inter.b2!.w(6)),
          Space.yf(4),
          Text(
            "Created at : $sessionDateTime",
            style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
          ),
          Space.yf(16),
          LiveJoinedBanner(
            count: joinedCount!,
            avatars: [
              'assets/pngs/pp.png',
              'assets/pngs/pp.png',
              'assets/pngs/pp.png',
            ],
          ),
        ],
      ),
    );
  }
}

class LiveJoinedBanner extends StatelessWidget {
  final int count;
  final List<String> avatars;

  const LiveJoinedBanner({
    super.key,
    required this.count,
    required this.avatars,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.vf(10),
      decoration: BoxDecoration(
        color: AppTheme.c.accent.purpleLight,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- Overlapping Avatars ---
          SizedBox(
            height: 31.h,
            width: 55.w,
            child: Stack(
              children: List.generate(
                avatars.length.clamp(0, 3),
                (i) => Positioned(
                  left: (i * 11.5).w,
                  child: CircleAvatar(
                    radius: 15.75.w,
                    backgroundColor: AppTheme.c.white,
                    child: CircleAvatar(
                      radius: 14.w,
                      backgroundImage: AssetImage(avatars[i]),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Space.xf(10),
          // --- Text ---
          Text('$count People Already Joined', style: AppText.inter.l1bm!),
        ],
      ),
    );
  }
}
