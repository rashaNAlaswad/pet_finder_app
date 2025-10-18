import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';

import '../widgets/home_error_view.dart';
import '../widgets/home_success_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return const HomeSuccessView();
        } else if (state is HomeFailure) {
          return HomeErrorView(error: state.error);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
