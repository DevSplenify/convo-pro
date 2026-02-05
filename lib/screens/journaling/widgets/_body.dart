part of '../journaling.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      floatingActionButton: Padding(
        padding: Space.hf(
          24,
        ).copyWith(bottom: MediaQuery.of(context).padding.bottom),
        child: AppButton(
          label: 'Create New Journal',
          onPressed: () {
            AppRoutes.createJournal.push(context);
          },
          buttonType: ButtonType.primaryWithIconLeft,
          iconPath: AppStaticData.plus,
          iconSize: 20,
          iconColor: AppTheme.c.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: _PinnedCollapsibleHeaderDelegate(
              minExtent: 145.h,
              maxExtent: 315.h,
            ),
          ),
        ],

        body: ListView(
          padding: Space.hf(24.w),
          children: [
            Text('Recent Journals', style: AppText.b1b!),
            Space.yf(15),
            GestureDetector(
              onTap: () {
                AppRoutes.journalSearch.push(context);
              },
              behavior: HitTestBehavior.translucent,
              child: SearchField(
                name: 'Search Journals',
                hint: 'Search anything...',
                enabled: false,
                readOnly: true,
              ),
            ),
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

class _PinnedCollapsibleHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;

  _PinnedCollapsibleHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Clean snap: if any scrolling happened, go to collapsed state
    final bool isExpanded = shrinkOffset < 10; // Small threshold for snap

    return Stack(
      fit: StackFit.expand,
      children: [
        // Arc background
        ClipPath(
          clipper: UpwardArcClipper(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pngs/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Journaling', style: AppText.b1b!),
              Space.yf(53),

              // Show stats only when expanded
              if (isExpanded)
                SizedBox(
                  height: 120.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('257', style: AppText.h2b!),
                      Space.yf(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/journaling.svg',
                            width: 24.w,
                            height: 24.h,
                            colorFilter: ColorFilter.mode(
                              AppTheme.c.primary.main!,
                              BlendMode.srcIn,
                            ),
                          ),
                          Space.xf(
                            7,
                          ), // Changed from yf to xf for horizontal spacing
                          Text('Total Journals', style: AppText.inter.l1bm!),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(_PinnedCollapsibleHeaderDelegate oldDelegate) => false;
}
