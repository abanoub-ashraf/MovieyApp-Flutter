import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../themes/app_colors.dart';
import '../../../../../common/extensions/text_theme_extensions.dart';

class TabsTitleWidget extends StatelessWidget {
    final String title;
    final VoidCallback onTap;
    final bool isSelected;

    const TabsTitleWidget({ 
        Key? key,
        required this.title,
        required this.onTap,
        this.isSelected = false,
    }) : super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                        bottom: BorderSide(
                            color: isSelected 
                                ? AppColors.royalBlue 
                                : Colors.transparent,
                            width: 1.h,
                        ),
                    ),
                ),
                child: Text(
                    title,
                    style: isSelected
                        ? Theme.of(context).textTheme.royalBlueSubtitle1
                        : Theme.of(context).textTheme.subtitle1
                ),
            ),
        );
    }
}