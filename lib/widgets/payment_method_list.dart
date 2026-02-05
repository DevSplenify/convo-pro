import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodList extends StatelessWidget {
  final List<String> titles;
  final List<String> images;

  final String? selectedMethod;
  final ValueChanged<String> onChanged;

  const PaymentMethodList({
    super.key,
    required this.titles,
    required this.images,

    required this.selectedMethod,
    required this.onChanged,
  }) : assert(titles.length == images.length);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final image = images[index];
        final selected = selectedMethod == title;

        return GestureDetector(
          onTap: () => onChanged(title),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 12.h),
            padding: Space.all(12),
            decoration: BoxDecoration(
              color: selected ? AppTheme.c.primary.shade200 : AppTheme.c.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: selected
                    ? AppTheme.c.primary.main!
                    : AppTheme.c.lightGrey.main!,
                width: 0.85.w,
              ),
            ),
            child: Row(
              children: [
                /// Image
                Container(
                  height: 44.r,
                  width: 54.r,
                  padding: Space.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppTheme.c.background.main!,
                  ),
                  child: Image.asset(image),
                ),

                Space.xf(10),

                /// Title
                Expanded(child: Text(title, style: AppText.inter.b2!.w(6))),
              ],
            ),
          ),
        );
      }),
    );
  }
}
