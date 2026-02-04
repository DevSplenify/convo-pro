part of '../locked_journals.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Locked Journals',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            SearchField(name: 'Search Journals', hint: 'Search anything...'),
            Space.yf(15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: Space.z,
              itemCount: journalList.length,
              itemBuilder: (context, index) {
                final item = journalList[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: JournalCard(
                    date: item['date'],
                    time: item['time'],
                    title: item['title'],
                    description: item['description'],
                    indicatorColor: item['color'],
                    iconBgColor: item['iconBgColor'],
                    onTap: () {
                      AppRoutes.viewJournal.push(context);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
