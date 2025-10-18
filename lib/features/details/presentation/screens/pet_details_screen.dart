import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/details_cubit.dart';
import '../widgets/pet_details_success_view.dart';
import '../widgets/details_shimmer_view.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const DetailsShimmerView();
          } else if (state is DetailsSuccess) {
            return PetDetailsSuccessView(breed: state.breed);
          } else if (state is DetailsFailure) {
            return Text('Error: ${state.error.message}');
          }
          return const DetailsShimmerView();
        },
      ),
    );
  }
}
