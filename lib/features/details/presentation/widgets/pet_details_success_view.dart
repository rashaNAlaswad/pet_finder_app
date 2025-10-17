import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'temperament_chips.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/domain/entities/breed.dart';
import 'pet_details_header.dart';

class PetDetailsSuccessView extends StatelessWidget {
  const PetDetailsSuccessView({super.key, required this.breed});
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PetDetailsHeader(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(breed.name, style: AppTextStyles.font28blackBold),
                verticalSpace(4.h),
                PetInfoRow(
                  icon: Icons.location_on,
                  text: 'Origin: ',
                  subText: breed.origin,
                ),
                verticalSpace(8.h),
                PetInfoRow(
                  icon: Icons.calendar_month,
                  text: 'Life Span: ',
                  subText: '${breed.lifeSpan} years',
                ),
                verticalSpace(8.h),
                PetInfoRow(
                  icon: Icons.scale,
                  text: 'Weight: ',
                  subText: '${breed.weight.metric} kg',
                ),
                verticalSpace(8.h),
                Text('Description:', style: AppTextStyles.font18blackBold),
                verticalSpace(8.h),
                Text(breed.description, style: AppTextStyles.font16greyRegular),
                verticalSpace(8.h),
                TemperamentChips(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PetInfoRow extends StatelessWidget {
  const PetInfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.subText,
  });

  final IconData icon;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.w,
      children: [
        Icon(icon, color: AppColors.tealPrimary, size: 20.sp),
        verticalSpace(8.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: text, style: AppTextStyles.font16blackMedium),
              TextSpan(text: subText, style: AppTextStyles.font16greyRegular),
            ],
          ),
        ),
      ],
    );
  }
}
