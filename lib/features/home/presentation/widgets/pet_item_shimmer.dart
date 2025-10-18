import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../../../core/helper/spacing.dart';

class PetItemShimmer extends StatelessWidget {
  const PetItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageShimmer(),
              horizontalSpace(16),
              Expanded(child: _buildTextContentShimmer()),
              horizontalSpace(10),
              _buildHeartShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageShimmer() {
    return ShimmerLoading(
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildTextContentShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextLine(120.w, 18.h),
        verticalSpace(8.h),
        _buildTextLine(80.w, 14.h),
        verticalSpace(8.h),
        _buildTextLine(60.w, 14.h),
      ],
    );
  }

  Widget _buildTextLine(double width, double height) {
    return ShimmerLoading(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildHeartShimmer() {
    return ShimmerLoading(
      child: Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
