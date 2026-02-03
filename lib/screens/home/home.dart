import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/widgets/design/cards/ai_recommendations.dart';
import 'package:convo_pro/widgets/design/cards/courses_completetion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';
part 'widgets/_user_header.dart';
part 'widgets/_custom_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
