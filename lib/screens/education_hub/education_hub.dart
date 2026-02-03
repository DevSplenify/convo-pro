import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/widgets/core/headers/see_all_heading.dart';
import 'package:convo_pro/widgets/design/cards/courses_completetion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';

class EducationHubScreen extends StatelessWidget {
  const EducationHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
