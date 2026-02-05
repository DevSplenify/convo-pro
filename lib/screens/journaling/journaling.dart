import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/screens/locked_journals/locked_journals.dart';
import 'package:convo_pro/statics/app_statics.dart';
import 'package:convo_pro/widgets/design/buttons/app_button/app_button.dart';
import 'package:convo_pro/widgets/design/cards/journal_card.dart';
import 'package:convo_pro/widgets/design/textfields/search_textfield/search_field.dart';
import 'package:convo_pro/widgets/upward_arc_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';

class JournalingScreen extends StatelessWidget {
  const JournalingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
