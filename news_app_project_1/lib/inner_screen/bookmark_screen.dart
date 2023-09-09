import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/widgets/empty_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../services/utils.dart';
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
        body: const EmptyScreenWidget(
          text: 'Oh ohh!! Nothing added',
          imagePath: 'assets/bookmark.png',
        )

        /*ListView.builder(
                  itemCount: 20,
                  itemBuilder: (ctx, index) {
                    return const CardListWidget();
                  },
                ),*/

        );
  }
}
