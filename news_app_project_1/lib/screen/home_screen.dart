import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/consts/enum_vars.dart';

import '../services/utils.dart';
import '../widgets/article_widget.dart';
import '../widgets/drawer.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsTabsRef = NewsTabType.allNews;
  int currentPageIndex = 0;

  String sortBy = SortByEnum.publishedAt.name;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    final size = Utils(context).getScreenSize;

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
                        paginationButton(
                          title: 'Prev',
                          function: () {
                            if (currentPageIndex == 0) {
                              return;
                            }
                            setState(() {
                              currentPageIndex -= 1;
                            });
                          },
                        ),
                        Flexible(
                          flex: 2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(6),
                                  color: currentPageIndex == index
                                      ? Colors.white12
                                      : Theme.of(context).cardColor,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentPageIndex = index;
                                      });
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Text('${index + 1}'),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        paginationButton(
                          title: 'Next',
                          function: () {
                            if (currentPageIndex == 5) {
                              return;
                            }
                            setState(() {
                              currentPageIndex += 1;
                            });
                          },
                        )
                      ],
                    ),
                  ),
            newsTabsRef == NewsTabType.topTrending
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton(
                            value: sortBy,
                            items: dropDownItem,
                            onChanged: (String? value) {},
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 6),
            if (newsTabsRef == NewsTabType.allNews)
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (ctx, index) {
                    return const CardListWidget();
                  },
                ),
              ),
            if (newsTabsRef == NewsTabType.topTrending)
              SizedBox(
                height: size.height * .55,
                child:  LoadingWidget( newsTabsRef: newsTabsRef,),
                // Swiper(
                //   itemWidth: size.width*.85,
                //   layout: SwiperLayout.STACK,
                //   viewportFraction: 0.9,
                //   itemCount: 10,
                //   itemBuilder: (context, index) {
                //     return const TopTrendingWidget();
                //   },
                // ),
              ),
          ],
        ),
      ),
    );
  }

//  Drop Down Menu Items:
  List<DropdownMenuItem<String>> get dropDownItem {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortByEnum.relevency.name,
        child: Text(
          SortByEnum.relevency.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(
          SortByEnum.publishedAt.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(
          SortByEnum.popularity.name,
        ),
      )
    ];
    return menuItem;
  }

// Pagination Widget:

  Widget paginationButton({required Function function, required String title}) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      child: Text(title),
    );
  }
}
