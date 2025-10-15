import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';

class AppElevatedButton extends StatelessWidget {
  final double? borderRadius;
  final Color? borderSideColor;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final String? buttonIcon;
  final VoidCallback? onPressed;

  const AppElevatedButton({
    super.key,
    this.borderRadius,
    this.borderSideColor,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    this.buttonTextStyle,
    this.buttonIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.tealPrimary,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 72.w,
            vertical: verticalPadding?.h ?? 16.h,
          ),
          fixedSize: Size(
            buttonWidth?.w ?? double.maxFinite,
            buttonHeight ?? 54.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
          ),
        ),
        onPressed: onPressed,
        child: buttonIcon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12.w,
                children: [
                  SvgPicture.asset(buttonIcon!, width: 24.w, height: 24.h),
                  Text(
                    buttonText,
                    style: buttonTextStyle ?? AppTextStyles.font18whiteSemiBold,
                  ),
                ],
              )
            : Text(
                buttonText,
                style: buttonTextStyle ?? AppTextStyles.font18whiteSemiBold,
              ),
      ),
    );
  }
}
