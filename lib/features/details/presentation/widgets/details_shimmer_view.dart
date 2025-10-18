import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../../../core/helper/spacing.dart';

class DetailsShimmerView extends StatelessWidget {
  const DetailsShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderShimmer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleShimmer(),
                verticalSpace(4),
                _buildInfoRowShimmer(Icons.location_on),
                verticalSpace(8),
                _buildInfoRowShimmer(Icons.calendar_month),
                verticalSpace(8),
                _buildInfoRowShimmer(Icons.scale),
                verticalSpace(8),
                _buildDescriptionTitleShimmer(),
                verticalSpace(8),
                _buildDescriptionShimmer(),
                verticalSpace(8),
                _buildTemperamentChipsShimmer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderShimmer() {
    return Stack(
      children: [
        ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: 375.h,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
          ),
        ),
        _buildBackButtonShimmer(),
        _buildHeartButtonShimmer(),
      ],
    );
  }

  Widget _buildBackButtonShimmer() {
    return Positioned(
      top: 44.h,
      left: 15.w,
      child: ShimmerLoading(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildHeartButtonShimmer() {
    return Positioned(
      top: 44.h,
      right: 15.w,
      child: ShimmerLoading(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleShimmer() {
    return ShimmerLoading(
      child: Container(
        width: 200.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildInfoRowShimmer(IconData icon) {
    return Row(
      children: [
        ShimmerLoading(
          child: Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        horizontalSpace(8.w),
        ShimmerLoading(
          child: Container(
            width: 120.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionTitleShimmer() {
    return ShimmerLoading(
      child: Container(
        width: 100.w,
        height: 18.h,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildDescriptionShimmer() {
    return Column(
      children: [
        ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        verticalSpace(4.h),
        ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        verticalSpace(4.h),
        ShimmerLoading(
          child: Container(
            width: 200.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTemperamentChipsShimmer() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(
        6,
        (index) => ShimmerLoading(
          child: Container(
            width: 80.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
