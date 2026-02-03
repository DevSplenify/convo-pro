part of '../audio_sessions.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Audio Sessions',
      ),
      body: Padding(
        padding: Space.hf(24).copyWith(top: 16.h),
        child: Column(
          children: [
            SwitchContainer(
              name: 'audio filter',
              options: ['All', 'Social', 'Family', 'Network', 'Friends'],
            ),
            Space.yf(16),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 24.h,
                ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
