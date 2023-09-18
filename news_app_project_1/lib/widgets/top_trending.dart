import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/inner_screen/blog_details.dart';
import 'package:news_app_project_1/model/news_model.dart';
import 'package:news_app_project_1/services/utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../inner_screen/news_detail_web_view.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({super.key});
  // final String url;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color colorText = Utils(context).getColorText;
    final newsModelProvider = Provider.of<NewsModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Material(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, NewsDetailScreen.routeName,
                arguments: newsModelProvider.publishedAt);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  imageUrl: newsModelProvider.urlToImage,
                  // "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
                  errorWidget: Image.asset('assets/empty_image.png'),
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Text(
                  newsModelProvider.title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colorText),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRightWithFade,
                              duration: const Duration(
                                milliseconds: 450,
                              ),
                              child: NewsDetailsWebView(
                                  url: newsModelProvider.url),
                              inheritTheme: true,
                              ctx: context),
                        );
                      },
                      icon: Icon(
                        Icons.link,
                        color: Colors.blue.shade300,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      newsModelProvider.dateToShow,
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: colorText),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
