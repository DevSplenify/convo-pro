import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/statics/app_statics.dart';
import 'package:convo_pro/widgets/core/headers/see_all_heading.dart';
import 'package:convo_pro/widgets/design/buttons/app_button/app_button.dart';
import 'package:convo_pro/widgets/design/cards/mood_container.dart';
import 'package:convo_pro/widgets/design/cards/recent_logs_card.dart';
import 'package:convo_pro/widgets/design/cards/triggers_card.dart';
import 'package:convo_pro/widgets/weekly_mood_pattern.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';
part 'data.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
