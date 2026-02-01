import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/widgets/core/app_bar/app_bar.dart';
import 'package:convo_pro/widgets/design/cards/convo_message_template_card.dart';
import 'package:convo_pro/widgets/design/textfields/search_textfield/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';
part 'data.dart';

class CategoryTemplatesScreen extends StatelessWidget {
  const CategoryTemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final String title = ModalRoute.of(context)?.settings.arguments as String;

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: _Body(title: title),
    );
  }
}
