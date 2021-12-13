import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
    const ThemeText._();

    ///
    /// get this font from google font package
    ///
    static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

    ///
    /// define this style for the headline6 property of the TextTheme() widget that
    /// goes in the root widget of the app
    ///
    static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
        fontSize: 20.sp,
        color: Colors.white,
    );

    ///
    /// define this style for the subtitle1 property of the TextTheme() widget that
    /// goes in the root widget of the app
    ///
    static TextStyle get _whiteSubtitle1 => _poppinsTextTheme.subtitle1!.copyWith(
        fontSize: 16.sp,
        color: Colors.white,
    );

    ///
    /// define this style for the bodyText2 property of the TextTheme() widget that
    /// goes in the root widget of the app
    ///
    static TextStyle get _whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
        fontSize: 14.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
    );

    ///
    /// this will go in the textTheme property inside the ThemeData() 
    /// inside the root widget of the app
    ///
    static TextTheme getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        subtitle1: _whiteSubtitle1,
        bodyText2: _whiteBodyText2,
    );
}