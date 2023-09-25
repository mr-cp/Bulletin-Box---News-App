import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/consts/enum_vars.dart';
import 'package:news_app_project_1/provider/bookmark_provider.dart';
import 'package:news_app_project_1/provider/news_provider.dart';
import 'package:news_app_project_1/services/utils.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../services/global_method.dart';

class NewsDetailScreen extends StatefulWidget {
  static const routeName = "/NewsDetailScreen";
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;
    final newsProvider = Provider.of<NewsProvider>(context);
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    final publishedAt = ModalRoute.of(context)!.settings.arguments as String;
    final currentNews = newsProvider.findByDate(publishedAt: publishedAt);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'By ${currentNews.author}',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: color),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: color),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentNews.title,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(currentNews.dateToShow, style: smallTextStyle),
                    Text(currentNews.readingTimeText, style: smallTextStyle),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Hero(
                    tag: currentNews.publishedAt,
                    child: FancyShimmerImage(
                      boxFit: BoxFit.fill,
                      errorWidget: Image.asset('assets/empty_image.png'),
                      imageUrl: currentNews.urlToImage,
                      // "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          try {
                            Share.share('"/${currentNews.url}"',
                                subject: 'short news from BB News');
                          } catch (err) {
                            await GlobalMethod.errDialogue(
                                errorMessage: 'Error: $err', context: context);
                          }
                        },
                        child: Card(
                          elevation: 17,
                          shape: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyLight.send,
                              size: 28,
                              color: color,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: GestureDetector(
                          onTap: () async {
                            if (isBookmarked) {
                              await bookmarkProvider.deleteBookmark();
                            } else {
                              await bookmarkProvider.addToBookmark(
                                  newsModel: currentNews);
                            }
                          },
                          child: Card(
                            elevation: 17,
                            shape: const CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                IconlyLight.bookmark,
                                size: 28,
                                color: color,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                TextContent(
                  label: currentNews.description,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 12),
                TextContent(
                  label: currentNews.content,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                // const SizedBox(height: 20),
                // const TextContent(
                //   label: 'Content ',
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold,
                // ),
                // const SizedBox(height: 12),
                // TextContent(
                //   label: 'content ' * 20,
                //   fontSize: 18,
                //   fontWeight: FontWeight.normal,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Text content:
class TextContent extends StatelessWidget {
  const TextContent(
      {super.key,
      required this.label,
      required this.fontSize,
      required this.fontWeight});
  final String label;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      label,
      // textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
