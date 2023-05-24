import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  static const primary = Color(0xFFF49627); //0xff7f69fc
  static const background = Color(0xFFF2F7FA);
  static const primaryGradient = CustomColorGradient(
    Color(0xFFFF8A00), //0xff6966fb
    Color(0xFFFF7A00), //0xff6966fb
  );
  static const secondaryGradient = CustomColorGradient(
    Color(0xFFFF8A00), //0xff6966fb
    Color(0xFFFF7A00),
  );

  static const darkText = Color(0xff3a3b3d);
  static const lightText = Color(0xff787E85);
  static const lightGreen = Color(0xff84bf31);
  static const disabled = Colors.grey;
  static const divider = Colors.grey;
  static const primaryColor = Color(0xFFFF8A00); // 0xFF8069fc
  static const secondaryColor = Color(0xFF1564c0); //0xff6966fb

}

class CustomFontSizes {
  static const xSmall = 10.0;
  static const small = 14.0;
  static const medium = 18.0;
  static const large = 24.0;
  static const xLarge = 34.0;
}

class CustomIconSizes {
  static const small = 26.0;
  static const medium = 30.0;
  static const large = 36.0;
}

class CustomSpacing {
  static const xSmall = 4.0;
  static const small = 8.0;
  static const medium = 16.0;
  static const large = 32.0;
  static const xLarge = 64.0;

  static SizedBox verticalSpace({double space = medium}) {
    return SizedBox(
      height: space,
    );
  }

  static SizedBox horizontalSpace({double space = medium}) {
    return SizedBox(
      width: space,
    );
  }
}

class CustomBorderRadius {
  static const small = 5.0;
  static const medium = 10.0;
  static const large = 20.0;
}

class CustomBreakpoints {
  static const xLargeScreen = 1400.0;
  static const largeScreen = 900.0;
  static const mediumScreen = 600.0;
  static const smallScreen = 400.0;
}

class CustomConstraints {
  static const maxSectionWidth = 1000.0;
}


final customTheme = ThemeData(
  primaryColor: CustomColors.primary,
  disabledColor: CustomColors.disabled,
  dividerColor: CustomColors.divider,
  textTheme: const TextTheme(
    headline5: TextStyle(
      color: CustomColors.darkText,
      fontSize: CustomFontSizes.large,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      color: CustomColors.darkText,
      fontSize: CustomFontSizes.small,
    ),
    bodyText1: TextStyle(
      color: CustomColors.darkText,
      fontSize: CustomFontSizes.small,
      fontWeight: FontWeight.bold,
    ),
    button: TextStyle(
      fontSize: CustomFontSizes.small,
    ),
  ),
  iconTheme: const IconThemeData(
    color: CustomColors.primary,
  ),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    elevation: 1,
    iconTheme: IconThemeData(color: CustomColors.darkText),
    toolbarTextStyle: TextStyle(
      color: CustomColors.darkText,
      fontSize: CustomFontSizes.medium,
      fontWeight: FontWeight.w500,
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  ),
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)))),
  colorScheme: const ColorScheme.light()
      .copyWith(
          background: Colors.white,
          onBackground: CustomColors.darkText,
          primary: CustomColors.primary,
          onPrimary: Colors.white,
          secondary: CustomColors.primary,
          onSecondary: Colors.white)
      .copyWith(secondary: CustomColors.primary),
);

class CustomColorGradient {
  final Color color1;
  final Color color2;

  const CustomColorGradient(this.color1, this.color2);
}
