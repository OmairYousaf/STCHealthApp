import 'package:flutter/material.dart';

class StcHealthStyles {
  //PRIMARY COLORS
  static Color primaryLightColor = const Color(0xffe5eaef);
  static Color primaryColor = const Color(0xff2AB3C6);

// //GREY COLORS
//   static Color cardBorderColor = const Color(0xfff2f4f7);
//   static Color lightGreyColor = const Color(0xff667085);
//   static Color primaryTextColorLight = CHIStyles.lightGreyColor;

// // Color primaryTextColor = const Color(0xff1d2939);
//   static Color primaryTextColor = const Color(0xff101828);
//   static Color iconColor = const Color(0xff174571);

// //ERROR COLORS

//   static Color whiteColor = Colors.white;
//   static Color appBgColor = const Color(0xfffcfcfd);
//   static Color chatBubbleTextClr =
//       const Color(0xff667085); // using for custom_Subscription_vu...
//   static Color cardColor = const Color(0xffFFFFFF);
//   static Color checkboxTextColor = Colors.black;
//   static Color scaffoldLBackgroundColor = const Color(0xffFCFCFD);
//   static Color scaffoldDBackgroundColor = const Color(0xff121212);

//   static Color darkSuccessColor = const Color(0xff05603A);
//   static Color primarySuccessColor = const Color(0xff12B76A);
//   static Color lightSuccessColor = const Color(0xffD1FADF);
//   static Color darkErrorColor = const Color(0xff912018);
//   static Color primaryErrorColor = const Color(0xfff04438);
//   static Color lightErrorColor = const Color(0xfffee4e2);
//   static Color primaryWraningColor = const Color(0xffF79009);
//   static Color lightWraningColor = const Color(0xffFEF0C7);
//   static Color primaryPurpleColor = const Color(0xff9E77ED);
//   static Color lightPurpleColor = const Color(0xffF4EBFF);

// //WARNING COLORS
//   // static Color darkWarningColor = const Color(0xff05603A);
//   static Color primaryWarningColor = const Color(0xfff79009);
//   static Color lightWarningColor = const Color(0xffFEF0C7);

// //TEXT STYLES

// // BORDERS
//   static OutlineInputBorder chiOutlineBorder =
//       OutlineInputBorder(borderSide: BorderSide(color: primaryTextColorLight));
//   static Border? cardBorder = Border.all(color: cardBorderColor, width: 1.0);
//   static BorderRadius cardRadius = BorderRadius.circular(16);

// // Shadow
//   static List<BoxShadow> cardShadow = [
//     BoxShadow(
//       offset: const Offset(0, 1),
//       blurRadius: 2,
//       spreadRadius: 0,
//       color: const Color(0xff101828).withOpacity(0.05),
//     ),
//   ];
  static TextStyle displaylargeStyle = const TextStyle(
      color: Color(0xffffffff),
      fontSize: 36,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter');
//   static TextStyle displayXsSemiBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 24, fontWeight: FontWeight.w600);
//   static TextStyle displayXsMediumStyle = TextStyle(
//       color: primaryTextColor, fontSize: 24, fontWeight: FontWeight.w500);
//   static TextStyle displayXsNormalStyle = TextStyle(
//       color: primaryTextColor, fontSize: 24, fontWeight: FontWeight.w400);
//   static TextStyle xlBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 20, fontWeight: FontWeight.w700);
//   static TextStyle xlSemiBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 20, fontWeight: FontWeight.w600);
//   static TextStyle xlMediumStyle = TextStyle(
//       color: primaryTextColor, fontSize: 20, fontWeight: FontWeight.w500);
//   static TextStyle xlNormalStyle = TextStyle(
//       color: primaryTextColor, fontSize: 20, fontWeight: FontWeight.w400);
//   static TextStyle lgBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 18, fontWeight: FontWeight.w700);
//   static TextStyle lgSemiBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 18, fontWeight: FontWeight.w600);
//   static TextStyle lgMediumStyle = TextStyle(
//       color: primaryTextColor, fontSize: 18, fontWeight: FontWeight.w500);
//   static TextStyle lgNormalStyle = TextStyle(
//       color: primaryTextColor, fontSize: 18, fontWeight: FontWeight.w400);
//   static TextStyle mdBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 16, fontWeight: FontWeight.w700);
//   static TextStyle mdSemiBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 16, fontWeight: FontWeight.w600);
//   static TextStyle mdMediumStyle = TextStyle(
//       color: primaryTextColor, fontSize: 16, fontWeight: FontWeight.w500);
//   static TextStyle mdNormalStyle = TextStyle(
//       color: primaryTextColor, fontSize: 16, fontWeight: FontWeight.w400);
//   static TextStyle smBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 14, fontWeight: FontWeight.w700);
//   static TextStyle smSemiBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 14, fontWeight: FontWeight.w600);
//   static TextStyle smMediumStyle = TextStyle(
//       color: primaryTextColor, fontSize: 14, fontWeight: FontWeight.w500);
//   static TextStyle smNormalStyle = TextStyle(
//       color: primaryTextColor, fontSize: 14, fontWeight: FontWeight.w400);
//   static TextStyle xsBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 12, fontWeight: FontWeight.w700);
//   static TextStyle xsSemiBoldStyle = TextStyle(
//       color: primaryTextColor, fontSize: 12, fontWeight: FontWeight.w600);
//   static TextStyle xsMediumStyle = TextStyle(
//       color: primaryTextColor, fontSize: 12, fontWeight: FontWeight.w500);
//   static TextStyle xsNormalStyle = TextStyle(
//       color: primaryTextColor, fontSize: 12, fontWeight: FontWeight.w400);

//   // light Theme
//   static ThemeData lightThemeData() {
//     return ThemeData(
//       fontFamily: 'Inter',
//       useMaterial3: true,
//       brightness: Brightness.light,
//       primaryColor: CHIStyles.primaryColor,
//       colorScheme: const ColorScheme.light().copyWith(
//         primary: CHIStyles.primaryColor,
//         secondary: CHIStyles.primaryLightColor,
//         surfaceTint: CHIStyles.cardColor,
//       ),
//       scaffoldBackgroundColor: CHIStyles.scaffoldLBackgroundColor,
//       floatingActionButtonTheme:
//           FloatingActionButtonThemeData(backgroundColor: primaryColor),
//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         backgroundColor: CHIStyles.scaffoldLBackgroundColor,
//       ),
//       bottomSheetTheme: BottomSheetThemeData(
//         backgroundColor: CHIStyles.scaffoldLBackgroundColor,
//         surfaceTintColor: Colors.transparent,
//       ),
//     );
//   }

// // dark Theme
//   static ThemeData darkThemeData() {
//     return ThemeData(
//       fontFamily: 'Inter',
//       useMaterial3: true,
//       brightness: Brightness.dark,
//       primaryColor: CHIStyles.primaryColor,
//       scaffoldBackgroundColor: CHIStyles.scaffoldDBackgroundColor,
//       colorScheme: const ColorScheme.dark().copyWith(
//         primary: CHIStyles.primaryColor,
//         secondary: CHIStyles.primaryLightColor,
//         surfaceTint: CHIStyles.cardColor,
//       ),
//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         backgroundColor: CHIStyles.scaffoldDBackgroundColor,
//       ),
//       floatingActionButtonTheme:
//           FloatingActionButtonThemeData(backgroundColor: primaryColor),
//       bottomSheetTheme: BottomSheetThemeData(
//         backgroundColor: CHIStyles.scaffoldDBackgroundColor,
//         surfaceTintColor: Colors.transparent,
//       ),
//     );
//   }
}
