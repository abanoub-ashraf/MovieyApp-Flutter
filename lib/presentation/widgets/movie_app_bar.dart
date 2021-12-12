import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/app_assets.dart';
import 'logo_widget.dart';

class MovieAppBar extends StatelessWidget {
    const MovieAppBar({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().statusBarHeight + 8.h,
                left: 10.h,
                right: 10.h,
            ),
            child: Row(
                children: [
                    IconButton(
                        onPressed: () {}, 
                        icon: SvgPicture.asset(
                            AppAssets.menuSVG,
                            height: 12.h,
                        )
                    ),
                    Expanded(
                        child: LogoWidget(
                            height: 14.h
                        )
                    ),
                    IconButton(
                        onPressed: () {}, 
                        icon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 12.h,
                        ),
                    ),
                ],
            ),
        );
    }
}