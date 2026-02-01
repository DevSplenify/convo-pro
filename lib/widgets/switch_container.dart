import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchContainer extends StatelessWidget {
  final String name;
  final List<String> options;
  final String? initialValue;
  final Color? backgroundColor;
  final Color? selectedColor;
  final ValueChanged<String>? onChanged;

  const SwitchContainer({
    super.key,
    required this.name,
    required this.options,
    this.initialValue,
    this.backgroundColor,
    this.selectedColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return FormBuilderField<String>(
      name: name,
      initialValue: initialValue ?? options.first,
      builder: (field) {
        final selectedIndex = options.indexOf(
          field.value ?? initialValue ?? options.first,
        );

        return LayoutBuilder(
          builder: (context, constraints) {
            final segmentWidth = constraints.maxWidth / options.length;

            return Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: backgroundColor ?? AppTheme.c.white,
                borderRadius: BorderRadius.circular(32.r),
                border: Border.all(
                  color: AppTheme.c.lightGrey.main!,
                  width: 1.w,
                ),
              ),
              child: Stack(
                children: [
                  // Sliding background highlight
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    left: selectedIndex * segmentWidth,
                    top: 0,
                    bottom: 0,
                    width: segmentWidth,
                    child: Container(
                      margin: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: selectedColor ?? AppTheme.c.primary.main!,
                        borderRadius: BorderRadius.circular(32.r),
                        boxShadow: UIProps.cardShadow,
                      ),
                    ),
                  ),

                  // Full tappable segments
                  Row(
                    children: options.map((option) {
                      final isSelected = option == field.value;

                      return Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior
                              .opaque, // 👈 Makes full area tappable
                          onTap: () {
                            field.didChange(option);
                            onChanged?.call(option);
                          },
                          child: Center(
                            child: Text(
                              option,
                              style: isSelected
                                  ? AppText.inter.l1bm!.cl(AppTheme.c.white!)
                                  : AppText.inter.l1bm!.cl(
                                      AppTheme.c.text.shade800!,
                                    ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
