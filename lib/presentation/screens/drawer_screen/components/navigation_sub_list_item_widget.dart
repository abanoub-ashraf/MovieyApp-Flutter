import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationSubListItemWidget extends StatelessWidget {
    final String title;
    final VoidCallback onPressed;

    const NavigationSubListItemWidget({
        Key? key,
        required this.title,
        required this.onPressed,
    }) : super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onPressed,
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).primaryColor.withOpacity(0.7),
                            blurRadius: 2,
                        ),
                    ],
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                    ),
                    title: Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w100,
                        ),
                    ),
                ),
            ),
        );
    }
}