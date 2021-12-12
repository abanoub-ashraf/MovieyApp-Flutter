import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/app_colors.dart';

class SeparatorWidget extends StatelessWidget {
    const SeparatorWidget({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            height: 1.h,
            width: 80.w,
            padding: EdgeInsets.only(
                top: 2.h,
                bottom: 6.h
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(1.h)
                ),
                gradient: const LinearGradient(
                    colors: [
                        AppColors.violet,
                        AppColors.royalBlue,
                    ],
                ),
            ),
        );
    }
}