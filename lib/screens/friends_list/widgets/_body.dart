part of '../friends_list.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(title: 'Friends List', type: AppBarType.withText),
      floatingActionButton: Padding(
        padding: Space.hf(20),
        child: AppButton(
          label: 'Invite New Friend',
          onPressed: () {
            AppRoutes.inviteFriends.push(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

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
            FriendRequestsBanner(
              count: 3,
              avatars: [
                'assets/pngs/pp.png',
                'assets/pngs/pp.png',
                'assets/pngs/pp.png',
              ],
            ),
            Space.yf(16),
            Text('Friend List', style: AppText.b1bm!.w(6)),
            Space.yf(16),
            SearchField(name: 'friend_search', hint: 'Search Friends'),
            Space.yf(12),
            ListView.separated(
              shrinkWrap: true,
              padding: Space.z,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (context, index) => Space.yf(10),
              itemBuilder: (context, index) {
                return FriendListContainer(
                  name: 'Alice Smith',
                  streakCount: 7,
                  avatarUrl: 'assets/pngs/pp.png',
                  onTap: () {
                    AppRoutes.friendsProfile.push(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
