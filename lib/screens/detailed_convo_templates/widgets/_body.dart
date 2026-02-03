part of '../detailed_convo_templates.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Win-Win Sales Partnership ',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 16.h,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date Created',
                  style: AppText.inter.b2!.w(6).cl(AppTheme.c.text.main!),
                ),
                Text('Jan 15, 2024', style: AppText.inter.b2),
              ],
            ),
            Space.yf(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: AppText.inter.b2!.w(6).cl(AppTheme.c.text.main!),
                ),
                chip(
                  text: 'Friends',
                  bgColor: AppTheme.c.accent.purple!,
                  textColor: AppTheme.c.text.shade800!,
                ),
              ],
            ),
            Space.yf(16),
            AppDivider(),
            Space.yf(16),
            DetailsHeadings(
              titleStyle: AppText.inter.l1b,
              title: 'Introduction',
              subtitle:
                  'Hello [Recipient Name], I am reaching out to explore the possibility of a mutually beneficial sales partnership between our organizations. After reviewing your offerings and market presence, I believe there is strong potential for collaboration that could create value for both teams.',
            ),
            Space.yf(16),
            DetailsHeadings(
              titleStyle: AppText.inter.l1b,
              title: 'Value Proposition',
              subtitle:
                  'Content: I believe a partnership between our organizations could mutually accelerate our goals. By integrating our [Your Product/Service] with your existing platform, we could help you reduce customer churn by 15% while opening up a new revenue channel for both of us.',
            ),
            Space.yf(16),
            DetailsHeadings(
              titleStyle: AppText.inter.l1b,
              title: 'Call To Action',
              subtitle:
                  'Are you open to a brief 10-minute call next Tuesday at 2 PM to discuss what a pilot collaboration might look like?',
            ),
          ],
        ),
      ),
    );
  }
}
