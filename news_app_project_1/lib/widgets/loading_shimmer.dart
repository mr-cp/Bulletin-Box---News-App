import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project_1/consts/enum_vars.dart';
import 'package:news_app_project_1/services/utils.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    required this.newsTabsRef,
  });
  final NewsTabType newsTabsRef;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(15);
  late Color baseShimmerColor, highLightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var util = Utils(context);
    baseShimmerColor = util.baseShimmerColor;
    highLightShimmerColor = util.highLightShimmerColor;
    widgetShimmerColor = util.widgetShimmerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return widget.newsTabsRef == NewsTabType.topTrending
        ? Swiper(
            itemWidth: size.width * .85,
            layout: SwiperLayout.STACK,
            viewportFraction: 0.9,
            itemCount: 10,
            itemBuilder: (context, index) {
              return TopTrendingLoadingWidget(
                  baseShimmerColor: baseShimmerColor,
                  highLightShimmerColor: highLightShimmerColor,
                  size: size,
                  widgetShimmerColor: widgetShimmerColor,
                  borderRadius: borderRadius);
            },
          )
        : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (ctx, index) {
                return ArticleShimmerEffect(
                    baseShimmerColor: baseShimmerColor,
                    highLightShimmerColor: highLightShimmerColor,
                    widgetShimmerColor: widgetShimmerColor,
                    size: size,
                    borderRadius: borderRadius);
              },
            ),
          );
  }
}

// loading shimmer effect for top trending:

class TopTrendingLoadingWidget extends StatelessWidget {
  const TopTrendingLoadingWidget({
    super.key,
    required this.baseShimmerColor,
    required this.highLightShimmerColor,
    required this.size,
    required this.widgetShimmerColor,
    required this.borderRadius,
  });

  final Color baseShimmerColor;
  final Color highLightShimmerColor;
  final Size size;
  final Color widgetShimmerColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
        ),
        child: Shimmer.fromColors(
          baseColor: baseShimmerColor,
          highlightColor: highLightShimmerColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: size.height * 0.33,
                  width: double.infinity,
                  color: widgetShimmerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius, color: widgetShimmerColor),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * 0.025,
                    width: size.width * .24,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: widgetShimmerColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// article loading widgets code:

class ArticleShimmerEffect extends StatelessWidget {
  const ArticleShimmerEffect({
    super.key,
    required this.baseShimmerColor,
    required this.highLightShimmerColor,
    required this.widgetShimmerColor,
    required this.size,
    required this.borderRadius,
  });

  final Color baseShimmerColor;
  final Color highLightShimmerColor;
  final Color widgetShimmerColor;
  final Size size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        color: Theme.of(context).cardColor,
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
              child: Shimmer.fromColors(
                baseColor: baseShimmerColor,
                highlightColor: highLightShimmerColor,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: widgetShimmerColor,
                        height: size.height * .14,
                        width: size.width * .26,
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
                            Container(
                              height: size.height * .06,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: Colors.red),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: size.height * .03,
                                width: size.width * .4,
                                decoration: BoxDecoration(
                                    borderRadius: borderRadius,
                                    color: Colors.red),
                              ),
                            ),
                            const SizedBox(height: 8),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClipOval(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: size.height * .03,
                                    width: size.width * .4,
                                    decoration: BoxDecoration(
                                        borderRadius: borderRadius,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
