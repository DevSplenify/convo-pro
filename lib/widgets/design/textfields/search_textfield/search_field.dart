import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

part 'enums.dart';

class SearchField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final String? errorText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputformatters;
  final SearchFieldType type;
  final VoidCallback? onTapAdd;
  final Color? textColor;
  final Color? fillColor;
  final Color? iconColor;
  final double? borderRadius;
  final Color? borderColor;
  final bool hasShadow;

  const SearchField({
    super.key,
    this.controller,
    this.enabled,
    this.initialValue,
    this.prefixIcon,
    required this.name,
    this.hint,
    this.readOnly = false,
    this.textInputType,
    this.inputformatters,
    this.errorText,
    this.validator,
    this.type = SearchFieldType.primary,
    this.onTapAdd,
    this.textColor,
    this.fillColor,
    this.iconColor,
    this.borderRadius,
    this.borderColor,
    this.hasShadow = true,
  });

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(375, 812));

    final textColor = widget.textColor ?? AppTheme.c.text.shade800!;

    return IgnorePointer(
      ignoring: widget.enabled == false || widget.readOnly,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
          boxShadow: widget.hasShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 25,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: FormBuilderTextField(
          controller: widget.controller,
          inputFormatters: widget.inputformatters,
          focusNode: _focusNode,
          style: AppText.b2!.copyWith(color: textColor),
          cursorColor: textColor,
          enabled: widget.enabled ?? true,
          initialValue: widget.initialValue,
          name: widget.name,
          keyboardType: widget.textInputType,
          readOnly: widget.readOnly,
          onTapOutside: (_) {
            _focusNode.unfocus();
          },
          decoration: InputDecoration(
            errorText: widget.errorText,
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 8.w,
                top: 0,
                bottom: 0,
              ),
              child:
                  widget.prefixIcon ??
                  SvgPicture.asset(
                    'assets/svgs/search-normal.svg',
                    width: 20.w,
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                      widget.iconColor ?? AppTheme.c.text.shade800!,
                      BlendMode.srcIn,
                    ),
                  ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 21.w,
              minHeight: 21.h,
            ),
            filled: true,
            fillColor: widget.fillColor ?? AppTheme.c.white,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.5.h,
            ),
            hintText: widget.hint ?? 'Search',
            hintStyle: AppText.b2!.cl(AppTheme.c.text.main!),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                width: 1.w,
                color: widget.borderColor ?? AppTheme.c.lightGrey.main!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                width: 1.w,
                color: widget.borderColor ?? AppTheme.c.lightGrey.main!,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.5),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.5),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                width: AppDimensions.normalize(0.75),
                color: AppTheme.c.white!,
              ),
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
