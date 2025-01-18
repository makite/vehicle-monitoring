import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_monitoring_app/core/utils/theme.dart';

abstract class AppTextStyle {
  static TextStyle txtInterSemiBold14Primary = TextStyle(
    color: AppColors.primary,
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtInterBold28Primary = TextStyle(
    color: AppColors.primary,
    fontSize: 28.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
  static TextStyle txtInterSemiBold18Lightgreen900 = TextStyle(
    color: AppColors.lightGreen,
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle boldtxtInterRegular16Lightblue900 = TextStyle(
    color: AppColors.lightBlue900,
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
  static TextStyle txtInterSemiBold24Lightblue900 = TextStyle(
    color: AppColors.lightBlue900,
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtInterSemiBold24Lightgreen900 = TextStyle(
    color: AppColors.lightGreen,
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtInterRegular12Gray700 = TextStyle(
    color: AppColors.gray700,
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtInterRegular14 = TextStyle(
    color: AppColors.gray900,
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static TextStyle underline = TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: AppColors.black9003f,
    color: AppColors.black900,
    fontSize: 14.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    decorationThickness: 2.0,
  );
}
