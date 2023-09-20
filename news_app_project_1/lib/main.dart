import 'package:flutter/material.dart';
import 'package:news_app_project_1/consts/theme_data.dart';
import 'package:news_app_project_1/inner_screen/blog_details.dart';
import 'package:news_app_project_1/provider/bookmark_provider.dart';
import 'package:news_app_project_1/provider/dark_theme_provider.dart';
import 'package:news_app_project_1/provider/news_provider.dart';
import 'package:news_app_project_1/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  //  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  Future<void> getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool isDarkTheme = false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (builder, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const HomeScreen(),
            routes: {
              NewsDetailScreen.routeName: (ctx) => const NewsDetailScreen(),
            },
          );
        },
      ),
    );
  }
}
