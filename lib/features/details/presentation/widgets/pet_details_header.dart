import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/helper/navigation_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import 'pet_image_widget.dart';

class PetDetailsHeader extends StatelessWidget {
  const PetDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PetImageWidget(),
        _buildBackButton(context),
        _buildHeartButton(),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 44.h,
      left: 15.w,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.tealPrimary,
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }

  Widget _buildHeartButton() {
    return Positioned(
      top: 44.h,
      right: 15.w,
      child: IconButton(
        icon: SvgPicture.asset(AppIcons.heart),
        onPressed: () {},
      ),
    );
  }
}
