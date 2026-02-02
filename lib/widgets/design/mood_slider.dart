import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormBuilderMoodSlider extends StatelessWidget {
  final String name;
  final String title;
  final double initialValue;

  const FormBuilderMoodSlider({
    super.key,
    required this.name,
    required this.title,
    this.initialValue = 2,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return FormBuilderField<double>(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<double?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.inter.b2!.w(6)),
            const SizedBox(height: 12),

            /// Slider with solid primary track and custom thumb with glow
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8.h,
                overlayShape: SliderComponentShape.noOverlay,
                thumbShape: _CustomThumbShape(
                  enabledThumbRadius: 10.r,
                  borderWidth: 3.w,
                  borderColor: AppTheme.c.white!,
                  thumbColor: AppTheme.c.primary.main,
                ),
                trackShape: _SolidTrackShape(),
                activeTrackColor: AppTheme.c.primary.main,
                inactiveTrackColor: AppTheme.c.white,
              ),
              child: Slider(
                min: 0,
                max: 4,
                value: field.value ?? initialValue,
                onChanged: (value) {
                  field.didChange(value);
                },
              ),
            ),

            Space.yf(12),

            /// Mood Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _MoodBox(icon: 'assets/svgs/dead.svg'),
                _MoodBox(icon: 'assets/svgs/sad.svg'),
                _MoodBox(icon: 'assets/svgs/neutral.svg'),
                _MoodBox(icon: 'assets/svgs/smilee.svg'),
                _MoodBox(icon: 'assets/svgs/happy.svg'),
              ],
            ),

            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// CUSTOM THUMB WITH LINEAR GRADIENT SHADOW
// ─────────────────────────────────────────────
class _CustomThumbShape extends SliderComponentShape {
  final double enabledThumbRadius;
  final double borderWidth;
  final Color borderColor;
  final Color? thumbColor;

  const _CustomThumbShape({
    required this.enabledThumbRadius,
    required this.borderWidth,
    required this.borderColor,
    this.thumbColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(enabledThumbRadius + borderWidth);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final color = thumbColor ?? sliderTheme.thumbColor ?? Colors.blue;

    // ── Shadow with LINEAR GRADIENT ──
    final shadowRadius = enabledThumbRadius * 2.2;
    final shadowRect = Rect.fromCircle(
      center: center.translate(0, 3), // slight vertical offset
      radius: shadowRadius,
    );

    final shadowPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.5),
          color.withValues(alpha: 0.15),
          color.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.8, 1.0],
      ).createShader(shadowRect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawCircle(center.translate(0, 3), shadowRadius, shadowPaint);

    // ── Border (white ring) ──
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, enabledThumbRadius + borderWidth, borderPaint);

    // ── Main thumb (solid primary color) ──
    final thumbPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, enabledThumbRadius, thumbPaint);
  }
}

// ─────────────────────────────────────────────
// SOLID TRACK SHAPE WITH BORDER ON INACTIVE TRACK
// ─────────────────────────────────────────────
class _SolidTrackShape extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 8;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;

    return Rect.fromLTWH(
      offset.dx,
      trackTop,
      parentBox.size.width,
      trackHeight,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final rect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    // Active track (left of thumb) - solid primary color
    final activeRect = Rect.fromLTRB(
      rect.left,
      rect.top,
      thumbCenter.dx,
      rect.bottom,
    );

    final activePaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(activeRect, const Radius.circular(12)),
      activePaint,
    );

    // Inactive track (right of thumb) - with border
    final inactiveRect = Rect.fromLTRB(
      thumbCenter.dx,
      rect.top,
      rect.right,
      rect.bottom,
    );

    final inactiveRRect = RRect.fromRectAndRadius(
      inactiveRect,
      const Radius.circular(12),
    );

    // Draw inactive track fill
    final inactivePaint = Paint()
      ..color =
          sliderTheme.inactiveTrackColor ?? Colors.blue.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    context.canvas.drawRRect(inactiveRRect, inactivePaint);

    // Draw inactive track border
    final borderPaint = Paint()
      ..color = (AppTheme.c.lightGrey.main ?? Colors.blue).withValues(alpha: 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    context.canvas.drawRRect(inactiveRRect, borderPaint);
  }
}

// ─────────────────────────────────────────────
// MOOD ICON BOX
// ─────────────────────────────────────────────
class _MoodBox extends StatelessWidget {
  final String icon;

  const _MoodBox({required this.icon});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon, height: 40.h, width: 40.w);
  }
}
