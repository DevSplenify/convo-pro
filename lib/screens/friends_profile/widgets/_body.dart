part of '../friends_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Albert profile',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: const AssetImage('assets/pngs/pp.png'),
            ),
            Space.yf(12),
            Text('Albert Flores', style: AppText.inter.b2b!.w(6)),
            Space.yf(2),
            Text(
              'albert@gmail.com',
              style: AppText.inter.b2!.copyWith(color: AppTheme.c.text.main),
            ),
            Space.yf(16),
            Row(
              children: [
                Text(
                  'Used Templates',
                  style: AppText.b1bm!,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Space.yf(12),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: convoMessageTemplates.length,
              separatorBuilder: (_, _) => Space.yf(12),
              itemBuilder: (context, index) {
                final item = convoMessageTemplates[index];

                return ConvoMessageTemplateCard(
                  title: item['title'],
                  description: item['description'],
                  category: item['category'],
                  tag: item['tag'],
                  isInitiallyFavorite: item['isInitiallyFavorite'],
                  onTap: () {
                    AppRoutes.detailedConvoTemplates.push(context);
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
