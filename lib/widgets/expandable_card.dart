import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandableCard extends StatefulWidget {
  final String question;
  final String answer;
  final Color? backgroundColor;
  final Color? iconColor;

  const ExpandableCard({
    super.key,
    required this.question,
    required this.answer,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  late final AnimationController _controller;
  late final Animation<double> _iconRotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    /// UP when collapsed, DOWN when expanded
    _iconRotation =
        Tween<double>(
          begin: -0.25, // UP
          end: 0.0, // DOWN
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: _toggleExpand,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppTheme.c.white,
          borderRadius: UIProps.buttonRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Question Row
            Padding(
              padding: Space.all(16, 12),
              child: Row(
                children: [
                  /// Question Text
                  Expanded(
                    child: Text(widget.question, style: AppText.inter.b2!.w(6)),
                  ),

                  /// Arrow (UP → DOWN)
                  RotationTransition(
                    turns: _iconRotation,
                    child: SvgPicture.asset(
                      'assets/svgs/arrow_right.svg',
                      width: 20.w,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(
                        widget.iconColor ?? AppTheme.c.text.shade800!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Answer (Expanded Content)
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
                child: Column(
                  children: [
                    Space.yf(4),
                    AppDivider(),
                    Space.yf(10),
                    Text(
                      widget.answer,
                      style: AppText.inter.l1!.copyWith(
                        color: AppTheme.c.text.main,
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 350),
              sizeCurve: Curves.fastOutSlowIn,
            ),
          ],
        ),
      ),
    );
  }
}
