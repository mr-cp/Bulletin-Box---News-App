import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project_1/consts/enum_vars.dart';
import 'package:news_app_project_1/inner_screen/news_detail_web_view.dart';
import 'package:news_app_project_1/services/utils.dart';
import 'package:page_transition/page_transition.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({
    super.key,
    required this.imageUrl, required this.title, required this.url, required this.dateToShow, required this.readingTime
  });
  final String imageUrl, title, url, dateToShow, readingTime;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/NewsDetailScreen');

            // Navigator.push(
            //   context,
            //   PageTransition(
            //     type: PageTransitionType.fade,
            //     duration: const Duration(milliseconds: 450),
            //     child: const NewsDetailScreen(heroTag:'anime' ,),
            //     inheritTheme: true,
            //     ctx: context,
            //   ),
            // );
          },
          child: Stack(
            children: [
              Container(
                height: 40,
                width: 120,
                color: Colors.brown[50],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 120,
                  color: Colors.brown[50],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 120,
                  color: Colors.brown[50],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 40,
                  width: 120,
                  color: Colors.brown[50],
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                        height: size.height * .10,
                        width: size.width * .20,
                        boxFit: BoxFit.fill,
                        errorWidget: Image.asset('assets/empty_image.png'),
                        imageUrl: imageUrl,
                        //"https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
                      ),
                    ),
                    // const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              style: smallTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '⌛ $readingTime',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: smallTextStyle,
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const NewsDetailsWebView(),
                                      //   ),
                                      // );
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType
                                                .leftToRightWithFade,
                                            duration: const Duration(
                                              milliseconds: 450,
                                            ),
                                            child:  NewsDetailsWebView(url: url),
                                            inheritTheme: true,
                                            ctx: context),
                                      );
                                    },
                                    icon: const Icon(Icons.link),
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    dateToShow,
                                    style: smallTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
