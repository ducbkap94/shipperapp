import 'package:flutter/rendering.dart';
import 'package:shiper/config/app_colors.dart';
import 'package:shiper/config/app_dimens.dart';

class AppTextStyles {
  static const String openSansBold = 'OpenSans-Bold';
  static const String openSansRegular = 'OpenSans-Regular';
  static const String robotoRegular = 'Roboto-Regular';

  static final normal10cFFFFFF = TextStyle(
    fontFamily: openSansBold,
    fontSize: AppDimens.sp10,
    color: AppColors.cFFFFFF,
  );
  static final robotoR18cFFFFF = TextStyle(
    fontFamily: robotoRegular,
    fontSize: AppDimens.sp18,
    color: AppColors.cFFFFFF,
  );
  static final robotoR25cFFFFF = TextStyle(
    fontFamily: robotoRegular,
    fontSize: AppDimens.sp18,
    color: AppColors.cFF4646,
  );
}
