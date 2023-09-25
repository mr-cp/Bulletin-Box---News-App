import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/model/bookmark_model.dart';
import 'package:news_app_project_1/widgets/drawer.dart';
import 'package:news_app_project_1/widgets/empty_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../consts/enum_vars.dart';
import '../provider/bookmark_provider.dart';
import '../services/utils.dart';
import '../widgets/article_widget.dart';
import '../widgets/loading_shimmer.dart';
import 'search_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Bookmarks 🔖',
          style: GoogleFonts.slabo27px(
            textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 32,
                letterSpacing: 1.2,
                color: color),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: const Duration(
                      milliseconds: 450,
                    ),
                    child: const SearchScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            },
            icon: const Icon(
              IconlyBroken.search,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<BookmarkModel>>(
            future: Provider.of<BookmarkProvider>(context, listen: false)
                .fetchBookmark(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget(newsTabsRef: NewsTabType.allNews);
              } else if (snapshot.hasError) {
                return Align(
                  alignment: Alignment.center,
                  child: Expanded(
                      child: EmptyScreenWidget(
                    text: 'an error occured: ${snapshot.error}',
                    imagePath: 'assets/no_news.png',
                  )),
                );
              } else if (snapshot.data == null) {
                return const EmptyScreenWidget(
                  text: 'Oh ohh!! Nothing added',
                  imagePath: 'assets/bookmark.png',
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                      child: const ArticlesWidget(
                        isBookmark: true,
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
