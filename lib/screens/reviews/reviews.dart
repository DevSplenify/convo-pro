import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/models/reviews/reviews_model.dart';
import 'package:convo_pro/widgets/core/app_bar/app_bar.dart';
import 'package:convo_pro/widgets/core/headers/bottomsheet_header.dart';
import 'package:convo_pro/widgets/design/buttons/app_button/app_button.dart';
import 'package:convo_pro/widgets/design/textfields/container_textfield.dart/container_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';
part 'widgets/_review_card.dart';
part 'data.dart';
part 'bottom_sheets/write_review.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
