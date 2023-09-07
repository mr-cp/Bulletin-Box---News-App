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
  var newsTabsRef = NewsTabType.allNews;
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            Row(
              children: [
                NewsTabsWidget(
                  title: 'All News',
                  color: newsTabsRef == NewsTabType.allNews
                      ? Theme.of(context).cardColor
                      : Colors.transparent,
                  fontsize: newsTabsRef == NewsTabType.allNews ? 20 : 18,
                  func: () {
                    if (newsTabsRef == NewsTabType.allNews) {
                      return;
                    }
                    setState(() {
                      newsTabsRef = NewsTabType.allNews;
                    });
                  },
                ),
                const SizedBox(width: 15),
                NewsTabsWidget(
                  title: 'Top Trending',
                  color: newsTabsRef == NewsTabType.topTrending
                      ? Theme.of(context).cardColor
                      : Colors.transparent,
                  fontsize: newsTabsRef == NewsTabType.topTrending ? 20 : 18,
                  func: () {
                    if (newsTabsRef == NewsTabType.topTrending) {
                      return;
                    }
                    setState(
                      () {
                        newsTabsRef = NewsTabType.topTrending;
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            newsTabsRef == NewsTabType.topTrending
                ? Container()
                : SizedBox(
                    height: kBottomNavigationBarHeight,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PaginationButton(title: 'Prev', function: () {}),
                        Flexible(
                          flex: 2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: Container(
                                      color: Theme.of(context).cardColor,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(child: Text('1')),
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                        PaginationButton(title: 'Next', function: () {})
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget PaginationButton({required Function function, required String title}) {
    return ElevatedButton(
        onPressed: () {
          function() {}
        },
        child: Text(title));
  }
}

/* Flexible(
                          flex: 2,
                          child: Container(
                            color:Colors.amber,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Container(
                                        color: Colors.blueGrey,
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text('1'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),*/ 