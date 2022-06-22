import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeModel {
  final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blueGrey,
    primaryColor: const Color(0xFF004e89),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[100],
    shadowColor: Colors.grey[200],
    brightness: Brightness.light,
    fontFamily: 'Mulish',
    colorScheme: ColorScheme.light(
        primary: Colors.black, //text
        secondary: Colors.grey[700]!, //text
        onPrimary: Colors.white, //card -1
        onSecondary: Colors.grey[100]!,
        surface: Colors.grey[300]!, //shadow color -1
        onBackground: Colors.grey[800]!, //loading card color
        background: const Color(0xFF0D71B0),
        onSecondaryContainer: const Color.fromRGBO(212, 234, 244, 1)),
    sliderTheme: const SliderThemeData(
        trackHeight: 1.5,
        activeTrackColor: Color(0xFF004e89),
        inactiveTrackColor: Colors.white,
        trackShape: RectangularSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0)),
    dividerColor: Colors.grey[300],
    iconTheme: IconThemeData(color: Colors.grey[900]),
    primaryIconTheme: IconThemeData(
      color: Colors.grey[900],
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.7,
          color: Colors.grey[900]),
      iconTheme: IconThemeData(color: Colors.grey[900]),
      actionsIconTheme: IconThemeData(color: Colors.grey[900]),
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF004e89),
      unselectedItemColor: Colors.blueGrey[200],
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: TextStyle(
          fontFamily: 'Mulish',
          color: Colors.grey[900],
          fontWeight: FontWeight.w500),
    ),
  );

  final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blueGrey,
    primaryColor: const Color(0xFF004e89),
    backgroundColor: const Color(0xff303030),
    scaffoldBackgroundColor: const Color(0xff303030),
    shadowColor: Colors.grey[850],
    brightness: Brightness.dark,
    fontFamily: 'Mulish',
    colorScheme: ColorScheme.dark(
        primary: Colors.white, //text
        secondary: Colors.grey[400]!, //text
        onPrimary: Colors.grey[800]!, //card color -1
        onSecondary: Colors.grey[800]!, //card color -2
        surface: const Color(0xff303030), //shadow color - 1
        onBackground: Colors.grey[200]!, //loading card color
        background: const Color(0xFF0D71B0)),
    sliderTheme: SliderThemeData(
        trackHeight: 1.5,
        activeTrackColor: const Color(0xFF004e89),
        inactiveTrackColor: Colors.grey[400]!,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0)),
    dividerColor: Colors.grey[300],
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        color: Colors.grey[800],
        elevation: 0,
        titleTextStyle: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.7,
            color: Colors.grey[900]),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[800],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: TextStyle(
          fontFamily: 'Mulish',
          color: Colors.grey[900],
          fontWeight: FontWeight.w500),
    ),
  );
}
