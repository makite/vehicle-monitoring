import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

abstract class XPadding {
  static Padding onlyLeft = Padding(padding: EdgeInsets.only(left: 10.w));

  static Padding onlyRight = Padding(padding: EdgeInsets.only(right: 10.w));
  static EdgeInsets allSidePadding =
      EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h);
  static EdgeInsets allSidePaddingNew =
      EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h);
  static EdgeInsets allSidePadding5 = EdgeInsets.fromLTRB(5.w, 0.h, 5.w, 15.h);
  static EdgeInsets allTopAndLeft = EdgeInsets.only(top: 30.h, left: 10.w);
  static EdgeInsets onlyBottom = EdgeInsets.only(bottom: 5.h);
  static EdgeInsets onlyBottom10 = EdgeInsets.only(bottom: 10.h);
  static EdgeInsets leftRightSidePadding =
      EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 50.0.w);
  static EdgeInsets allSidePadding55 = EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h);
  static EdgeInsets allSidePadding40 = EdgeInsets.all(40.w);
}
