import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/screens/home_screen/home_screen.dart';
import '../presentation/themes/app_colors.dart';
import '../presentation/themes/theme_text.dart';

class MovieyApp extends StatelessWidget {
    const MovieyApp({ Key? key }) : super(key: key);
                                         
    @override
    Widget build(BuildContext context) {
        return ScreenUtilInit(
            builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Moviey App',
                theme: ThemeData(
                    primaryColor: AppColors.vulcan,
                    colorScheme: ThemeData().colorScheme.copyWith(
                        primary: AppColors.royalBlue,
                    ),
                    scaffoldBackgroundColor: AppColors.vulcan,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    ///
                    /// this function comes from the theme_text.dart file in 
                    /// the themes folder
                    ///
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: const AppBarTheme(elevation: 0), 
                ),
                home: const HomeScreen(),
            ),
        );
    }
}