import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/statics/app_statics.dart';
import 'package:convo_pro/widgets/core/headers/app_header.dart';
import 'package:convo_pro/widgets/design/buttons/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

part 'widgets/_body.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return _Body();
  }
}
