import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/di/dependency_injection.dart';
import '../../core/theme/app_colors.dart';
import '../favourite/presentation/screens/favourite_screen.dart';
import '../home/presentation/cubit/home_cubit.dart';
import '../home/presentation/screens/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            BlocProvider(
              create: (context) => getIt<HomeCubit>()..loadHomeData(),
              child: const HomeScreen(),
            ),
            const FavouriteScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha(10),
              offset: const Offset(0, -4),
              blurRadius: 4,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabChanged,
          selectedIconTheme: IconThemeData(color: AppColors.tealPrimary),
          unselectedIconTheme: IconThemeData(color: AppColors.grey),
          backgroundColor: AppColors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.home),
              label: 'Home',
              activeIcon: SvgPicture.asset(AppIcons.homeFilled),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.heart,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? AppColors.tealPrimary : AppColors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Favourite',
              activeIcon: SvgPicture.asset(AppIcons.heartFilled),
            ),
          ],
        ),
      ),
    );
  }
}
