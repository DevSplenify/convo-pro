import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';

class DetailsHeadings extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  const DetailsHeadings({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle ?? AppText.b1b!),
        Space.yf(8),
        Text(subtitle, style: AppText.inter.b2!.cl(AppTheme.c.text.main!)),
      ],
    );
  }
}
