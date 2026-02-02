// ═══════════════════════════════════════════════
//  MOOD ENUM
// ═══════════════════════════════════════════════
import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/widgets/design/buttons/app_button/app_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum Mood {
  great(5, 'assets/svgs/happy.svg'),
  good(4, 'assets/svgs/smilee.svg'),
  okay(3, 'assets/svgs/neutral.svg'),
  bad(2, 'assets/svgs/sad.svg'),
  awful(1, 'assets/svgs/dead.svg');

  final int value;
  final String emoji;

  const Mood(this.value, this.emoji);
}

// ═══════════════════════════════════════════════
//  WeeklyMoodPatternWidget  (reusable, no Scaffold)
// ═══════════════════════════════════════════════
class WeeklyMoodPatternWidget extends StatelessWidget {
  final List<FlSpot>? moodData;
  final VoidCallback? onInsightsPressed;
  final bool hasInsightsButton;

  const WeeklyMoodPatternWidget({
    super.key,
    this.moodData,
    this.onInsightsPressed,
    this.hasInsightsButton = true,
  });

  static const List<FlSpot> _sampleData = [
    FlSpot(0, 3.8),
    FlSpot(1, 3.2),
    FlSpot(2, 3.9),
    FlSpot(3, 2.8),
    FlSpot(4, 3.5),
    FlSpot(5, 4.2),
    FlSpot(6, 2.2),
  ];

  static const List<String> _days = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    final spots = moodData ?? _sampleData;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.buttonRadius,
      ),
      padding: Space.all(16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Weekly Mood Pattern', style: AppText.b1b),
          Space.yf(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _MoodEmojiAxis(),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: _MoodLineChart(spots: spots, days: _days),
                ),
              ),
            ],
          ),
          if (hasInsightsButton) ...[
            Space.yf(16),
            AppButton(
              label: 'View Detailed Insights',
              onPressed: () {
                if (onInsightsPressed != null) {
                  onInsightsPressed!();
                }
              },
              buttonType: ButtonType.outlined,
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
class _MoodEmojiAxis extends StatelessWidget {
  static const double _chartH = 200.0;
  static const double _topPad = 10.0;
  static const double _bottomReserved = 34.0;
  static const List<Mood> _moods = [
    Mood.great,
    Mood.good,
    Mood.okay,
    Mood.bad,
    Mood.awful,
  ];

  @override
  Widget build(BuildContext context) {
    final usable = _chartH - _topPad - _bottomReserved;
    final step = usable / (_moods.length - 1);

    return SizedBox(
      width: 44.w,
      height: _chartH,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(_moods.length, (i) {
          return Positioned(
            top: _topPad + step * i - 10,
            left: 1,
            child: _MoodBadge(mood: _moods[i]),
          );
        }),
      ),
    );
  }
}

class _MoodBadge extends StatelessWidget {
  final Mood mood;
  const _MoodBadge({required this.mood});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(mood.emoji, width: 20.w, height: 20.h);
  }
}

// ─────────────────────────────────────────────
class _MoodLineChart extends StatelessWidget {
  final List<FlSpot> spots;
  final List<String> days;

  const _MoodLineChart({required this.spots, required this.days});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      _data(),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  LineChartData _data() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) =>
            FlLine(color: AppTheme.c.lightGrey.main, strokeWidth: 1.w),
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24.w,
            interval: 1,
            getTitlesWidget: (value, meta) {
              final idx = value.toInt();
              if (idx < 0 || idx >= days.length) return const SizedBox();
              return SizedBox(
                width: 30.w,
                child: Text(
                  days[idx],
                  style: AppText.inter.l1!.copyWith(
                    color: AppTheme.c.text.main,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 6,
      minY: 1,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          curveSmoothness: 0.35,
          color: AppTheme.c.primary.main,
          barWidth: 2.5,
          dotData: const FlDotData(show: false),
          // belowAreaData: AreaData(show: false),
        ),
      ],
    );
  }
}
