import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_font_weight.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font18whiteSemiBold = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.medium,
    color: AppColors.white,
  );
}
