import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_monitoring_app/core/routes.dart';
import 'package:vehicle_monitoring_app/core/utils/image_constant.dart';
import 'package:vehicle_monitoring_app/core/utils/textstyle.dart';
import 'package:vehicle_monitoring_app/core/utils/theme.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Vehicle Monitoring App',
            body:
                "Drive Efficiency and Safety with Advanced Vehicle Monitoring Solutions.",
            image: buildImage(AppImages.carImage1),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Vehicle Monitoring App',
            body:
                "Track, Optimize, and Enhance Your Fleet with Real-Time Vehicle Monitoring.",
            image: buildImage(AppImages.carImage2),
            decoration: getPageDecoration(),
          ),
        ],
        done: InkWell(
          child: Text(
            'Get Started',
            style: AppTextStyle.txtInterSemiBold14Primary
                .copyWith(fontSize: 16.sp),
          ),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.homePage);
          },
        ),
        onDone: () {},
        next: Icon(
          Icons.arrow_forward,
          color: AppColors.primary,
          size: 28.sp,
        ),
        showNextButton: true,
        showBackButton: false,
        showSkipButton: true,
        dotsDecorator: getDotDecoration(),
        onChange: (index) {
          print('page$index selected');
        },
        skip: Text(
          'Skip',
          style:
              AppTextStyle.txtInterSemiBold14Primary.copyWith(fontSize: 16.sp),
        ),
      ),
    );
  }

  Widget buildImage(String path) {
    return Padding(
      padding: EdgeInsets.only(
          top: 40.h,
          left: 20.w,
          right: 20.w), // Add side padding for better layout
      child: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(16), // Rounded corners for the image
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4), // Slight shadow for depth
                ),
              ],
            ),
            child: AnimatedOpacity(
              opacity:
                  1.0, // You can dynamically change this for fade-in effects
              duration:
                  Duration(milliseconds: 500), // Smooth fade-in transition
              child: Image.asset(
                path,
                fit: BoxFit
                    .cover, // Ensures the image fills the container well without distortion
                height: 250.h, // Dynamically scaled for different screen sizes
                width: 250.w, // Consistent scaling with height
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            AppTextStyle.txtInterBold28Primary.copyWith(fontSize: 28.sp),
        bodyTextStyle: AppTextStyle
            .txtInterRegular12Gray700, // Added body text style for consistency
        imagePadding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h), // Adjusted padding for better spacing
        pageColor: AppColors.whiteA700,
      );

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
      color: AppColors.black9003f,
      size: Size(12.w, 12.h), // Adjusted size for better look
      activeSize: Size(24.w, 12.h), // Slightly larger active dots
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      activeColor: AppColors.primary,
    );
  }
}
