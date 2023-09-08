import 'package:flutter/material.dart';
import 'package:news_app_project_1/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get getColor => getTheme ? Colors.white : Colors.black;
  Color get getColorText => getTheme ? Colors.black : Colors.white;
  Size get getScreenSize => MediaQuery.of(context).size;

  Color get baseShimmerColor => getTheme?Colors.grey.shade500:Colors.grey.shade200; 
  Color get highLightShimmerColor => getTheme?Colors.grey.shade700:Colors.grey.shade400; 
  Color get widgetShimmerColor => getTheme?Colors.grey.shade600:Colors.grey.shade100; 

}
