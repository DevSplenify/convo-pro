import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConvoMessageTemplateCard extends StatefulWidget {
  final String title;
  final String description;
  final String category;
  final String tag;
  final bool isInitiallyFavorite;

  const ConvoMessageTemplateCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.tag,
    this.isInitiallyFavorite = false,
  });

  @override
  State<ConvoMessageTemplateCard> createState() =>
      _ConvoMessageTemplateCardState();
}

class _ConvoMessageTemplateCardState extends State<ConvoMessageTemplateCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isInitiallyFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 56.w,
                width: 56.w,
                decoration: BoxDecoration(
                  color: AppTheme.c.primary.shade200,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svgs/Solid clock.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              Space.xf(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: AppText.inter.b2b),
                    Space.yf(4),
                    Text(
                      widget.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Space.yf(16),

          /// Chips
          Row(
            children: [
              _chip(
                text: widget.category,
                bgColor: AppTheme.c.accent.purple!,
                textColor: AppTheme.c.text.shade800!,
              ),
              Space.xf(10),
              _chip(
                text: widget.tag,
                bgColor: const Color(0xFFF7F4F2),
                textColor: AppTheme.c.text.shade800!,
              ),
              Space.xm!,
              GestureDetector(
                onTap: _toggleFavorite,
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: const Color(0xFF7B6CF6),
                  size: 24.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip({
    required String text,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: Space.all(10, 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: UIProps.cardShadow,
      ),
      child: Text(text, style: AppText.inter.l1bm!.cl(textColor)),
    );
  }
}
