import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/helper/image_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/details_cubit.dart';

class PetImageWidget extends StatelessWidget {
  const PetImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return state is DetailsSuccess && state.breed.referenceImageId != ''
            ? Container(
                width: double.infinity,
                height: 375.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      state.breed.referenceImageId?.toImageUrl() ?? '',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black12,
                      BlendMode.overlay,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
              )
            : SvgPicture.asset(
                AppIcons.pets,
                height: 375.h,
                colorFilter: ColorFilter.mode(
                  AppColors.black.withAlpha(12),
                  BlendMode.overlay,
                ),
              );
      },
    );
  }
}
