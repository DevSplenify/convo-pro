import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormBuilderIntensitySlider extends StatelessWidget {
  final String name;
  final String title;
  final double initialValue;

  const FormBuilderIntensitySlider({
    super.key,
    required this.name,
    required this.title,
    this.initialValue = 1,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<double>(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<double?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.inter.b2!.w(6)),
            Space.yf(7),

            /// Slider with gradient track and custom thumb
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
                max: 2,
                value: field.value ?? initialValue,
                onChanged: (value) {
                  field.didChange(value);
                },
              ),
            ),

            Space.yf(8),

            /// Labels
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Low', style: AppText.inter.l1bm!),
                  Text('Moderate', style: AppText.inter.l1bm!),
                  Text('High', style: AppText.inter.l1bm!),
                ],
              ),
            ),

            if (field.errorText != null)
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Text(
                  field.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12.sp),
                ),
              ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// CUSTOM THUMB WITH SHADOW
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

    // Shadow
    final shadowRadius = enabledThumbRadius * 2.5;
    final shadowRect = Rect.fromCircle(
      center: center.translate(0, 2),
      radius: shadowRadius,
    );

    final shadowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          color.withValues(alpha: 0.4),
          color.withValues(alpha: 0.2),
          color.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(shadowRect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    canvas.drawCircle(center.translate(0, 2), shadowRadius, shadowPaint);

    // Border (white ring)
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, enabledThumbRadius + borderWidth, borderPaint);

    // Main thumb
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
