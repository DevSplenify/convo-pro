part of '../mindfulness.dart';

/// A scrollable streak-calendar widget.
/// Exactly 7 days are visible at once; the list scrolls continuously
/// through the whole month. Days up to [today] use the primary colour
/// with a happy emoji; future days are grey with a sad/neutral emoji.
class MindfulnessStreakCalendar extends StatefulWidget {
  const MindfulnessStreakCalendar({
    super.key,
    this.today,
    this.streakDays = 16,
  });

  /// The current date. Defaults to [DateTime.now()].
  final DateTime? today;

  /// Number of streak days shown in the header.
  final int streakDays;

  @override
  State<MindfulnessStreakCalendar> createState() =>
      _MindfulnessStreakCalendarState();
}

class _MindfulnessStreakCalendarState extends State<MindfulnessStreakCalendar> {
  late final ScrollController _scrollController;
  late final DateTime _now;
  late final List<DateTime> _days;
  int _todayIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _now = widget.today ?? DateTime.now();

    // ── build the full current-month day list ──────────────────────────────
    final int daysInMonth = DateTime(
      _now.year,
      _now.month + 1,
      0,
    ).day; // last day of month
    _days = List.generate(
      daysInMonth,
      (i) => DateTime(_now.year, _now.month, i + 1),
    );

    _todayIndex = _days.indexWhere(
      (d) => d.day == _now.day && d.month == _now.month,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Called once we know the real item width so we can jump to today.
  void _scrollToToday(double itemWidth) {
    // We want today roughly in the centre of the 7 visible slots (index 3).
    final double offset = (_todayIndex - 3) * itemWidth;
    if (offset > 0 && !_scrollController.hasClients) return; // safety
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          offset.clamp(0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── streak header row ───────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/streak.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                Space.xf(5),
                Text('Current Streak', style: AppText.inter.b2),
              ],
            ),
            Text('${widget.streakDays} Days', style: AppText.b1),
          ],
        ),
        Space.yf(12),

        // ── scrollable day row (exactly 7 visible) ─────────────────────────
        // LayoutBuilder gives us the available width so each item can be
        // sized to exactly 1/7 of the container.
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double itemWidth = constraints.maxWidth / 7;

            // Kick off the one-time scroll-to-today after layout is known.
            _scrollToToday(itemWidth);

            return SizedBox(
              height: 70.h,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                // continuous scroll — no page snapping, no bounce
                physics: const ClampingScrollPhysics(),
                itemCount: _days.length,
                itemExtent: itemWidth, // <── every item is exactly 1/7 wide
                itemBuilder: (BuildContext context, int index) {
                  final DateTime day = _days[index];

                  final bool isPast =
                      day.day <= _now.day; // same month guaranteed
                  final bool isToday = day.day == _now.day;

                  return _DayCircle(
                    dayNumber: day.day,
                    isPast: isPast,
                    isToday: isToday,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

// ─── single day circle ──────────────────────────────────────────────────────

class _DayCircle extends StatelessWidget {
  const _DayCircle({
    required this.dayNumber,
    required this.isPast,
    required this.isToday,
  });

  final int dayNumber;
  final bool isPast;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final Color circleColor = isPast
        ? AppTheme.c.primary.main!
        : AppTheme.c.background.shade200!;
    final Color emojiColor = isPast ? Colors.white : const Color(0xFFBBBBBB);
    final Color labelColor = isToday
        ? AppTheme.c.text.shade800!
        : AppTheme.c.text.main!;
    final FontWeight labelWeight = isToday ? FontWeight.w700 : FontWeight.w400;

    return Align(
      // Centre each circle horizontally inside its 1/7 slot
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(right: 7.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // day number
            Text(
              '$dayNumber',
              style: AppText.inter.b2!.copyWith(
                fontWeight: labelWeight,
                color: labelColor,
                height: 1.5,
              ),
            ),

            // circle + emoji
            Container(
              padding: Space.all(10, 12.5),
              decoration: BoxDecoration(
                color: circleColor,
                borderRadius: BorderRadius.circular(100.r),
                border: isPast
                    ? null
                    : Border.all(color: AppTheme.c.lightGrey.main!, width: 1.5),
              ),
              child: Center(
                child: SvgPicture.asset(
                  isPast ? 'assets/svgs/smile.svg' : 'assets/svgs/sadd.svg',
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(emojiColor, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
