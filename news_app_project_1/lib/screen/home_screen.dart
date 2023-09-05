import 'package:flutter/material.dart';
import 'package:news_app_project_1/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('1 is printing');
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Center(
        child: SwitchListTile(
          value: themeState.getDarkTheme,
          title: const Text('Theme'),
          secondary: Icon(themeState.getDarkTheme
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          onChanged: (bool value) {
                print('2 is printing');

           setState(() {
              themeState.setDarkTheme = value;
           });
          },
        ),
      ),
    );
  }
}
