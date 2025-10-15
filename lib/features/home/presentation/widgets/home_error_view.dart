import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../cubit/home_cubit.dart';

class HomeErrorView extends StatelessWidget {
  final ApiErrorModel error;

  const HomeErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 80, color: Colors.red.shade300),
            verticalSpace(16),
            Text(
              'Something went wrong',
              style: AppTextStyles.font16blackMedium,
            ),
            verticalSpace(8),
            Text(
              error.message ?? 'An unexpected error occurred',
              style: AppTextStyles.font16greyRegular,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            AppElevatedButton(
              buttonText: 'Retry',
              onPressed: () {
                context.read<HomeCubit>().loadHomeData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
