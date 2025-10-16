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
        List items = [];

        if (state is HomeSuccess) {
          items = state.breeds;
        } else if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final cubit = context.read<HomeCubit>();

        if (items.isEmpty) {
          return const Center(child: Text('No results found'));
        }

        return RefreshIndicator(
          onRefresh: () => cubit.refresh(),
          child: ListView.separated(
            controller: cubit.scrollController,
            itemCount: items.length + (cubit.isFetching ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < items.length) {
                return PetItem(breed: items[index]);
              }
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpace(16);
            },
          ),
        );
      },
    );
  }
}
