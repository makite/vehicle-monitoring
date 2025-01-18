import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 3,
      child: Container(
        padding: EdgeInsets.only(left: 71.w, right: 71.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/tilet_bottom.png',
              ),
              fit: BoxFit.contain),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text('')],
        ),
      ),
    );
  }
}
