import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviey_app/common/constants/app_strings.dart';
import 'package:moviey_app/presentation/screens/drawer_screen/components/navigation_expanded_list_item_widget.dart';
import 'package:moviey_app/presentation/screens/drawer_screen/components/navigation_list_item_widget.dart';
import '../../widgets/logo_widget.dart';

class NavigationDrawerScreen extends StatelessWidget {
    const NavigationDrawerScreen({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.7),
                        blurRadius: 4,
                    ),
                ],
            ),
            width: 300.w,
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: 8.h,
                                bottom: 30.h,
                                left: 8.w,
                                right: 8.w,
                            ),
                            child: LogoWidget(
                                height: 30.h,
                            ),
                        ),
                        NavigationListItemWidget(
                            title: AppStrings.favoriteMovies, 
                            onPressed: () {}
                        ),
                        NavigationExpandedListItemWidget(
                            title: AppStrings.language, 
                            onPressed: () {}, 
                            children: const [
                                AppStrings.englishLanguage, 
                                AppStrings.spanishLanguage,
                            ],
                        ),
                        NavigationListItemWidget(
                            title: AppStrings.feedback, 
                            onPressed: () {}
                        ),
                        NavigationListItemWidget(
                            title: AppStrings.about, 
                            onPressed: () {}
                        ),
                    ],
                ),
            ),
        );
    }
}