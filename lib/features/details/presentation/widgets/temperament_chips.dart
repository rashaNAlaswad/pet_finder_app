import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

import '../cubit/details_cubit.dart';

class TemperamentChips extends StatelessWidget {
  const TemperamentChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          return Wrap(
            spacing: 20.w,
            runSpacing: 8.h,
            children: state.breed.temperament
                .split(',')
                .map(
                  (e) => Chip(
                    label: Text(e.trim()),
                    backgroundColor: AppColors.surfaceTeal,
                    side: BorderSide(color: AppColors.surfaceTeal),
                    labelStyle: AppTextStyles.font16blackMedium,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                )
                .toList(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
