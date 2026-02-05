part of '../joined_live_session.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        type: AppBarType.withText,
        title: 'Joined Live Session',
        itemColor: AppTheme.c.white!,
        iconColor: AppTheme.c.white!,
      ),
      floatingActionButton: Padding(
        padding: Space.hf(24),
        child: AppButton(
          label: 'Leave Session',
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: AppTheme.c.accent.red!,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: SingleChildScrollView(
        child: Container(
          height: 1.sh,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 24.h,
            top: MediaQuery.of(context).padding.top + 48.h + 16.h,
            left: 24.w,
            right: 24.w,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pngs/Live.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jenna White',
                style: AppText.b1b!.copyWith(color: AppTheme.c.white),
              ),
              Space.yf(3),
              Text(
                'Follow me on instagram',
                style: AppText.inter.l1!.copyWith(color: AppTheme.c.white!),
              ),
              Space.yf(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'When life gives you limes, arrange them in a zesty flatlay ... more',
                          style: AppText.inter.l1!.copyWith(
                            color: AppTheme.c.white!,
                          ),
                        ),
                        Space.yf(16),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: Space.z,
                          itemCount: commentsData.length,
                          separatorBuilder: (_, _) => SizedBox(height: 16.h),
                          itemBuilder: (context, index) {
                            final item = commentsData[index];

                            return CommentTile(
                              username: item['username']!,
                              comment: item['comment']!,
                              time: item['time']!,
                              avatar: item['avatar']!,
                            );
                          },
                        ),
                        Space.yf(50),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      _buildActionIcon('assets/svgs/heart2.svg', '256', () {
                        // Handle heart icon tap
                      }),
                      Space.yf(20),
                      _buildActionIcon('assets/svgs/chat.svg', '128', () {
                        showCommentsBottomSheet(context);
                      }),
                      Space.yf(20),
                      GestureDetector(
                        onTap: () {
                          showShareToBottomSheet(context);
                        },
                        child: SvgPicture.asset(
                          'assets/svgs/send.svg',
                          colorFilter: ColorFilter.mode(
                            AppTheme.c.white!,
                            BlendMode.srcIn,
                          ),
                          width: 28.w,
                          height: 28.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcon(String iconPath, String count, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(AppTheme.c.white!, BlendMode.srcIn),
            width: 28.w,
            height: 28.h,
          ),
          Space.yf(6),
          Text(
            count,
            style: AppText.inter.l1bm!.copyWith(color: AppTheme.c.white!),
          ),
        ],
      ),
    );
  }
}
