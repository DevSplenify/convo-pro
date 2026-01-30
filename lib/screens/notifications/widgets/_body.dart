part of '../notifications.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(type: AppBarType.withText, title: 'Notifications'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 16.h,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today', style: AppText.b1b!.w(6)),
            Space.yf(10),
            NotificationCard(
              notificationText:
                  'Your conversation template "Meeting Agenda" has been approved.',
            ),
            Space.yf(8),
            NotificationCard(
              notificationText:
                  'New feature "Mood Tracker" is now available in the app.',
            ),
            Space.yf(18),
            Text('Nov 20', style: AppText.b1b!.w(6)),
            Space.yf(10),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (context, index) => Space.yf(8),
              itemBuilder: (context, index) => NotificationCard(
                notificationText:
                    'Your subscription will renew on 30th Jan 2025.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
