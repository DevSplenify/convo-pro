part of '../journal_search.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(name: 'Search Journals', hint: 'Search anything...'),
            Space.yf(16),
            Text('Results ', style: AppText.b1bm!),
            Space.yf(12),
            Container(
              padding: Space.all(12),
              decoration: BoxDecoration(
                color: AppTheme.c.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: Space.vf(index != 2 ? 20 : 0).copyWith(top: 0),
                    child: _buildJournalSearchItem(
                      'Journal Entry ${index + 1}',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalSearchItem(String searchedValue) {
    return Padding(
      padding: Space.vf(12),
      child: Row(
        children: [
          SvgPicture.asset('assets/svgs/chart2.svg', width: 24.w, height: 24.h),
          Space.xf(12),
          Expanded(
            child: Text(
              searchedValue,
              style: AppText.inter.b2!.copyWith(color: AppTheme.c.text.main),
            ),
          ),
        ],
      ),
    );
  }
}
