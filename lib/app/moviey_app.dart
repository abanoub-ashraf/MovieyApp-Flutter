import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviey_app/presentation/screens/home_screen.dart';
import 'package:moviey_app/presentation/themes/app_colors.dart';
import 'package:moviey_app/presentation/themes/theme_text.dart';

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
                    scaffoldBackgroundColor: AppColors.vulcan,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: const AppBarTheme(elevation: 0),
                ),
                home: const HomeScreen(),
            ),
        );
    }
}