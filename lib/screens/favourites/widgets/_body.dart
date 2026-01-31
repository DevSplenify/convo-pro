part of '../favourites.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Favourites',
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
            SearchField(name: 'Search Favorites', hint: 'Search Favorites'),
            Space.yf(16),
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
                  isInitiallyFavorite: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
