import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/consts/enum_vars.dart';

import '../services/utils.dart';
import '../widgets/drawer.dart';
import '../widgets/tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var newsTabs = GenreTabs.allNews;

    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Bulletin Box',
          style: GoogleFonts.orbitron(
            textStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 35,
                letterSpacing: 1,
                color: color),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // GenreSelector(
                //   title: 'All News',
                //   color: newsTabs == GenreTabs.allNews
                //       ? Theme.of(context).cardColor
                //       : Colors.transparent,
                //   fontsize: newsTabs == GenreTabs.allNews ? 22 : 12,
                //   func: () {
                //     if (newsTabs == GenreTabs.allNews) {
                //       return;
                //     }
                   
                //   },
                // ),
                // const SizedBox(width: 10),
                // GenreSelector(
                //   title: 'Top Trending',
                //   color: newsTabs == GenreTabs.topTrending
                //       ? Theme.of(context).cardColor
                //       : Colors.transparent,
                //   fontsize: newsTabs == GenreTabs.topTrending ? 22 : 12,
                //   func: () {
                //     if (newsTabs == GenreTabs.topTrending) {
                //       return;
                //     }
                //     setState(
                //       () {
                //         newsTabs = GenreTabs.topTrending;
                //       },
                //     );
                //   },
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
