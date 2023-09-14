import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/services/utils.dart';
import 'package:page_transition/page_transition.dart';

import '../inner_screen/news_detail_web_view.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color colorText = Utils(context).getColorText;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  imageUrl:
                      "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
                  errorWidget: Image.asset('assets/empty_image.png'),
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Title',
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
                              child:  NewsDetailsWebView(url: url),
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
                      '20/08/2023',
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
