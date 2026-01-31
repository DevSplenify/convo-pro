part of '../convo_templates.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(
        type: AppBarType.withWidget,
        title: 'Convo Templates',
        space: 16,
        trailingWidget: GestureDetector(
          onTap: () {
            AppRoutes.favourites.push(context);
          },
          child: SvgPicture.asset(
            'assets/svgs/heart.svg',
            width: 20.w,
            height: 20.h,
          ),
        ),
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
            SearchField(name: 'Search Templates', hint: 'Search Categories'),
            Space.yf(16),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: convoTemplates.length,
              separatorBuilder: (_, _) => Space.yf(16),
              itemBuilder: (context, index) {
                final item = convoTemplates[index];
                return TemplatesCategoriesCard(
                  title: item['title']!,
                  subtitle: item['subtitle']!,
                  image: item['image']!,
                  onTap: () {
                    AppRoutes.categoryTemplates.push(
                      context,
                      arguments: item['title'],
                    );
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
