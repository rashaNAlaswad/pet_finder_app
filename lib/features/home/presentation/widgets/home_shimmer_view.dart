import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../../../core/helper/spacing.dart';
import 'pet_item_shimmer.dart';

class HomeShimmerView extends StatelessWidget {
  const HomeShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleShimmer(),
              verticalSpace(20.h),
              _buildSearchBarShimmer(),
              verticalSpace(20.h),
              Expanded(child: _buildPetItemsShimmer()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleShimmer() {
    return ShimmerLoading(
      child: Container(
        width: 200.w,
        height: 30.h,
        decoration: BoxDecoration(color: AppColors.grey.withValues(alpha: 0.3)),
      ),
    );
  }

  Widget _buildSearchBarShimmer() {
    return ShimmerLoading(
      child: Container(
        height: 42.h,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildPetItemsShimmer() {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) => const PetItemShimmer(),
      separatorBuilder: (context, index) => verticalSpace(16),
    );
  }
}
