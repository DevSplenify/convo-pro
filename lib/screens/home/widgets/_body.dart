part of '../home.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      extendBody: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _UserHeader(),
          Space.yf(16),
          Expanded(
            child: SingleChildScrollView(
              padding: Space.hf(24).copyWith(bottom: 150.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quick Links', style: AppText.b1b),
                  Space.yf(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildQuickActions(
                          'Conversation Templates',
                          'assets/svgs/templets.svg',
                          () {
                            AppRoutes.convoTemplates.push(context);
                          },
                        ),
                      ),
                      Space.xf(8),
                      Expanded(
                        child: _buildQuickActions(
                          'Your Mood Tracker',
                          'assets/svgs/smile.svg',
                          () {
                            AppRoutes.moodTracker.push(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Space.yf(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildQuickActions(
                          'AI Conversation Assistant',
                          'assets/svgs/bot.svg',
                          () {
                            AppRoutes.aiConversation.push(context);
                          },
                        ),
                      ),
                      Space.xf(8),
                      Expanded(
                        child: _buildQuickActions(
                          'Your Friends List',
                          'assets/svgs/user_W.svg',
                          () {
                            AppRoutes.friendsList.push(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Space.yf(24),
                  Text('Weekly Mood Trends', style: AppText.b1b),
                  Space.yf(12),
                  Row(
                    children: [
                      Expanded(
                        child: buildMoodTrends(
                          'Confidence Level',
                          40,
                          'Slightly Low',
                          'Monday',
                          AppTheme.c.accent.yellow!,
                          'assets/svgs/confidence.svg',
                          AppTheme.c.accent.yellowLight!,
                        ),
                      ),
                      Space.xf(10),
                      Expanded(
                        child: buildMoodTrends(
                          'Social Energy',
                          80,
                          'High',
                          'Friday',
                          AppTheme.c.accent.purple!,
                          'assets/svgs/time.svg',
                          AppTheme.c.accent.purpleLight!,
                        ),
                      ),
                    ],
                  ),
                  Space.yf(24),
                  Container(
                    padding: Space.all(8, 16),
                    decoration: BoxDecoration(
                      color: AppTheme.c.white,
                      borderRadius: UIProps.buttonRadius,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Therapeutic Short Courses', style: AppText.b1b),
                        Space.yf(12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTherapeuticCoursesItem(
                                '(ACT) Acceptance Commitment Therapy',
                                AppTheme.c.black!,
                                AppTheme.c.accent.purple!,
                                () {
                                  AppRoutes.act.push(context);
                                },
                              ),
                            ),
                            Space.xf(8),
                            Expanded(
                              child: _buildTherapeuticCoursesItem(
                                'Cognitive Behavioural Therapy',
                                AppTheme.c.white!,
                                AppTheme.c.accent.yellow!,
                                () {
                                  AppRoutes.cbt.push(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Space.yf(24),
                  Text('Courses Progress', style: AppText.b1b),
                  Space.yf(12),
                  CoursesCompletionCard(
                    progress: 45,
                    icon1Color: AppTheme.c.accent.yellow!,
                    icon2Color: AppTheme.c.accent.purple!,
                    icon1bg: AppTheme.c.accent.yellowLight!,
                    icon2bg: AppTheme.c.accent.purpleLight!,
                    coursesCompleted: 8,
                    timeSpent: '3h 20m',
                  ),
                  Space.yf(24),
                  Text('AI Recommendations', style: AppText.b1b),
                  Space.yf(12),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: Space.z!,
                    itemBuilder: (context, index) {
                      return AiRecommendations(
                        title: 'Journaling for Mental Health',
                        subtitle: 'Discover the benefits of daily journaling',
                        onTap: () {
                          // Handle tap
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Space.yf(12),
                    itemCount: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
