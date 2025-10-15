import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.backgroundColor,
    this.controller,
    this.borderRadius,
    this.prefixIcon,
    this.onChanged,
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final double? borderRadius;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.surfaceText),
              borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.surfaceText),
              borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            ),
        hintStyle: hintStyle ?? AppTextStyles.font16greyRegular,
        hintText: hintText ?? 'Search',
        prefixIcon:
            prefixIcon ??
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: Center(child: SvgPicture.asset(AppIcons.search)),
            ),
        fillColor: backgroundColor ?? AppColors.surfaceText,
        filled: true,
      ),
      style: AppTextStyles.font16blackMedium,
    );
  }
}
