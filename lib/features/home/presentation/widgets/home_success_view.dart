import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_text_styles.dart';

import '../../../../core/helper/spacing.dart';
import '../cubit/home_cubit.dart';
import 'breed_list_view.dart';
import 'search_bar_widget.dart';

class HomeSuccessView extends StatefulWidget {
  const HomeSuccessView({super.key});

  @override
  State<HomeSuccessView> createState() => _HomeSuccessViewState();
}

class _HomeSuccessViewState extends State<HomeSuccessView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              SearchBarWidget(
                controller: _searchController,
                onChanged: (value) => context.read<HomeCubit>().search(value),
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
