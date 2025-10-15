import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/helper/navigation_extensions.dart';
import '../../core/helper/spacing.dart';
import '../../core/router/routes.dart';
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
          _buildImage(),
          verticalSpace(30.h),
          _buildTextContent(),
          verticalSpace(40.h),
          _buildGetStartedButton(context),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: AppElevatedButton(
        buttonText: "Get Started",
        buttonIcon: AppIcons.pets,
        onPressed: () {
          context.pushNamed(Routes.home);
        },
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      AppImages.catAndDog,
      width: double.infinity,
      height: 305.h,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTextContent() {
    return Padding(
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
    );
  }
}
