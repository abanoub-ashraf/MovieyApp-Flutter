import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_assets.dart';

class LogoWidget extends StatelessWidget {
    final double height;

    const LogoWidget({
        Key? key, 
        required this.height
    }) : assert(
        height > 0, 
        'height should be greater than 0'
    ), 
    super(key: key);

    @override
    Widget build(BuildContext context) {
        return Image.asset(
            AppAssets.appLogo,
            color: Colors.white,
            height: height.h,
        );
    }
}