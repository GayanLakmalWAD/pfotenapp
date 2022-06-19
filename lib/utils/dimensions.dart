import 'package:sizer/sizer.dart';

class Dimensions {
  static double fontSizeExtraSmall = (SizerUtil.deviceType == DeviceType.mobile) ? 10.sp : 8.sp;
  static double fontSizeSmall = (SizerUtil.deviceType == DeviceType.mobile) ? 11.sp : 9.sp;
  static double fontSizeDefault = (SizerUtil.deviceType == DeviceType.mobile) ? 12.sp : 10.sp;
  static double fontSizeLarge = (SizerUtil.deviceType == DeviceType.mobile) ? 15.sp : 13.sp;
  static double fontSizeExtraLarge = (SizerUtil.deviceType == DeviceType.mobile) ? 16.sp : 14.sp;
  static double fontSizeOverLarge = (SizerUtil.deviceType == DeviceType.mobile) ? 24.sp : 22.sp;

  static const double paddingExtraSmall = 10.0;
  static const double paddingSmall = 12.0;
  static const double paddingDefault = 15.0;
  static const double paddingLarge = 20.0;
  static const double paddingExtraLarge = 25.0;
  static const double paddingOverLarge = 30.0;

  // static const double APP_BAR_HEIGHT = 70.0;
}