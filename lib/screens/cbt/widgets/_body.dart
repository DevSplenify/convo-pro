part of '../cbt.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(
        title: '(CBT) Cognitive Behavioral Therapy',
        type: AppBarType.withText,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: SwitchTabBar(
                options: const ['Audio Sessions', 'Text Sessions'],
                tabs: [_buildAudioSessionTab(), _buildTextSessionTab()],
                onIndexChanged: (index) {
                  debugPrint('Selected tab: $index');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioSessionTab() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, _) => Space.yf(16),
      itemBuilder: (context, index) {
        return AudioCard(
          title: 'Session Topic ${index + 1}',
          subtitle: 'Session Topic Description Lorem..',
          onTap: () {
            AppRoutes.detailAudioSession.push(context);
          },
          onPlayPressed: () {
            AppRoutes.detailAudioSession.push(context);
          },
        );
      },
    );
  }

  Widget _buildTextSessionTab() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, _) => Space.yf(16),
      itemBuilder: (context, index) {
        return TextCard(
          title: 'Session Topic ${index + 1}',
          subtitle: 'Session Topic Description Lorem..',
          onTap: () {
            AppRoutes.detailTextSession.push(context);
          },
          onReadPressed: () {
            AppRoutes.detailTextSession.push(context);
          },
        );
      },
    );
  }
}
