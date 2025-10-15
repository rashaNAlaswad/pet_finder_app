import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

import '../../../../core/helper/spacing.dart';
import 'breed_list_view.dart';
import 'search_bar_widget.dart';

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Your Forever Pet',
                style: AppTextStyles.font24blackBold,
              ),
              verticalSpace(20),
              SearchBarWidget(),
              verticalSpace(20),
              Text(
                'Categories',
                style: AppTextStyles.font24blackBold.copyWith(fontSize: 20),
              ),
              verticalSpace(20),
              Expanded(child: BreedListView()),
            ],
          ),
        ),
      ),
    );
  }
}
