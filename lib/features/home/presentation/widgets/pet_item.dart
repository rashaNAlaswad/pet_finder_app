import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/helper/image_extension.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/breed.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final imageUrl = breed.referenceImageId?.toImageUrl();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(10),
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
              _buildPetImage(imageUrl),
              horizontalSpace(16),
              Expanded(child: _buildTextContent()),
              horizontalSpace(10),
              SvgPicture.asset(AppIcons.heart, width: 20.w, height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetImage(String? imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )
          : const Icon(Icons.pets, size: 50),
    );
  }

  Widget _buildTextContent() {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(breed.name, style: AppTextStyles.font18blackBold),
        Text(
          breed.origin,
          style: AppTextStyles.font16greyRegular.copyWith(fontSize: 14),
        ),
        Text(
          '${breed.lifeSpan} years',
          style: AppTextStyles.font16greyRegular.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
