import 'package:flutter/material.dart';

import '../untils/app_colors.dart';

ThemeData getAppDarkTheme(){
  return ThemeData(
    primaryColor: AppsColors.primary,
    scaffoldBackgroundColor: AppsColors.background,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppsColors.background,
    centerTitle: true
  ),
    //themeText
    textTheme:TextTheme(
      displayLarge: TextStyle(
          color: AppsColors.white,fontSize: 32,fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
        color: AppsColors.white,fontSize: 16,),
      displaySmall: TextStyle(color: AppsColors.white.withOpacity(0.44),fontSize: 16),

    ),

    //themeButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          backgroundColor: AppsColors.primary

      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
      ),

      hintStyle: TextStyle(
        color: AppsColors.white,fontSize: 16,),
      fillColor: AppsColors.lightBlack,filled: true,

    )
  );
}
ThemeData getAppTheme(){
  return ThemeData(
      primaryColor: AppsColors.primary,
      scaffoldBackgroundColor: AppsColors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppsColors.deepGrey,
          centerTitle: true
      ),
      //themeText
      textTheme:TextTheme(
        displayLarge: TextStyle(
            color: AppsColors.background,fontSize: 32,fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
          color: AppsColors.background,fontSize: 16,),
        displaySmall: TextStyle(color: AppsColors.background.withOpacity(0.44),fontSize: 16),

      ),

      //themeButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            backgroundColor: AppsColors.primary

        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
        ),

        hintStyle: TextStyle(
          color: AppsColors.white,fontSize: 16,),
        fillColor: AppsColors.deepGrey,filled: true,

      )
  );
}