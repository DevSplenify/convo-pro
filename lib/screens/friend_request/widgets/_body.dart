part of '../friend_request.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Friend Requests', type: AppBarType.withText),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 20.w,
          right: 20.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Friend Requests', style: AppText.b1bm!.w(6)),
            Space.yf(16),
            SearchField(name: 'friend_search', hint: 'Search friends'),
            Space.yf(12),
            ListView.separated(
              shrinkWrap: true,
              padding: Space.z,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) => Space.yf(10),
              itemBuilder: (context, index) {
                return FriendRequestContainer(
                  name: 'Alice Smith',
                  streakCount: 7,
                  avatarUrl: 'assets/pngs/pp.png',
                  onTapAccept: () {},
                  onTapDecline: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
