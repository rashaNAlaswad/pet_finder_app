import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/spacing.dart';
import '../cubit/home_cubit.dart';
import 'pet_item.dart';

class BreedListView extends StatelessWidget {
  const BreedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return ListView.separated(
            itemCount: state.breeds.length,
            itemBuilder: (context, index) {
              return PetItem(breed: state.breeds[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpace(16);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
