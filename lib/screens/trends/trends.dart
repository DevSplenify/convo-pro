import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/screens/home/home.dart';
import 'package:convo_pro/widgets/core/app_bar/app_bar.dart';
import 'package:convo_pro/widgets/design/cards/recent_logs_card.dart';
import 'package:convo_pro/widgets/weekly_mood_pattern.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';

class TrendsScreen extends StatelessWidget {
  const TrendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
