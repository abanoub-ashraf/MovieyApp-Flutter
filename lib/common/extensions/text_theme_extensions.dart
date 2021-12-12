import 'package:flutter/material.dart';
import '../../presentation/themes/app_colors.dart';

///
/// - we will use this extension function on the selected tab in the bottom part 
///   of the home screen
/// 
/// - we will use this function like this: [Theme.of(context).textTheme.royalBlueSubtitle1]
///
extension ThemeTextExtension on TextTheme {
    TextStyle get royalBlueSubtitle1 => subtitle1!.copyWith(
        color: AppColors.royalBlue,
        fontWeight: FontWeight.w600,
    );
}