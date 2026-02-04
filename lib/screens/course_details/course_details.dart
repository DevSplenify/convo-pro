import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/widgets/core/app_bar/app_bar.dart';
import 'package:convo_pro/widgets/design/buttons/app_button/app_button.dart';
import 'package:convo_pro/widgets/lesson_list.dart';
import 'package:convo_pro/widgets/rating_review_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

part '_state.dart';
part 'widgets/_body.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
