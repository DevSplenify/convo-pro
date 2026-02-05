import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentTile extends StatelessWidget {
  final String username;
  final String comment;
  final String time;
  final String avatar;

  const CommentTile({
    super.key,
    required this.username,
    required this.comment,
    required this.time,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        CircleAvatar(radius: 14.r, backgroundImage: AssetImage(avatar)),

        Space.xf(8),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: AppText.inter.l1b!.cl(AppTheme.c.white!)),
              Space.yf(4),
              Text(comment, style: AppText.inter.l1!.cl(AppTheme.c.white!)),
              Space.yf(1),
              Row(
                children: [
                  Text(
                    time,
                    style: AppText.inter.l2bm!.cl(AppTheme.c.text.main!),
                  ),
                  Space.xf(4),
                  Icon(
                    Icons.circle,
                    size: 4.r,
                    color: AppTheme.c.lightGrey.shade600!,
                  ),
                  Space.xf(4),

                  Text(
                    'Reply',
                    style: AppText.inter.l2b!.cl(
                      AppTheme.c.lightGrey.shade500!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
