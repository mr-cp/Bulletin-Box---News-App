import 'package:flutter/material.dart';
import 'package:news_app_project_1/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utils{
    BuildContext context;
   Utils(this.context);

   bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
    Color get getColor => getTheme?Colors.white:Colors.black;

}