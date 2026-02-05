part of '../journaling.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: _PinnedCollapsibleHeaderDelegate(
              minExtent: 160,
              maxExtent: 360,
            ),
          ),
        ],
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            SizedBox(height: 24),
            Text('Body Content'),
            SizedBox(height: 600),
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
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Arc background
        ClipPath(
          clipper: UpwardArcClipper(),
          child: Container(color: const Color(0xFFf0efec)),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Journal Log',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              const Spacer(),

              Opacity(
                opacity: 1 - progress,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.book, size: 28),
                    SizedBox(height: 8),
                    Text(
                      '257',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Total Journals'),
                  ],
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(_PinnedCollapsibleHeaderDelegate oldDelegate) => false;
}
