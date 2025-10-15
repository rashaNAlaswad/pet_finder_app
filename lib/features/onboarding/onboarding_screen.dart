import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/helper/spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.catAndDog,
            width: double.infinity,
            height: 305.h,
            fit: BoxFit.cover,
          ),
          verticalSpace(30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              spacing: 10.h,
              children: [
                Text(
                  "Find Your Best Companion With Us",
                  style: AppTextStyles.font32whiteBold,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Join & discover the best suitable pets as per your preferences in your location",
                  style: AppTextStyles.font16greyRegular,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          verticalSpace(40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: AppElevatedButton(
              buttonText: "Get Started",
              buttonIcon: AppIcons.pets,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
