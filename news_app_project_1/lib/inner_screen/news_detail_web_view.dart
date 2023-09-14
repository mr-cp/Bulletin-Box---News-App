import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app_project_1/services/global_method.dart';
import 'package:news_app_project_1/services/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsWebView extends StatefulWidget {
  const NewsDetailsWebView({super.key, required this.url});
  final String url;
  @override
  State<NewsDetailsWebView> createState() => _NewsDetailsWebViewState();
}

class _NewsDetailsWebViewState extends State<NewsDetailsWebView> {
  late WebViewController webViewController;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController.canGoBack()) {
          webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            widget.url,
            style: TextStyle(color: color),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await showModelSheetFunction();
              },
              icon: const Icon(Icons.more_horiz),
            )
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1.0 ? Colors.transparent : Colors.blue,
            ),
            Expanded(
              child: WebView(
                initialUrl:
                    // "https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/",
                    widget.url,
                zoomEnabled: true,
                onProgress: (progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // show model bottom sheet:

  Future<void> showModelSheetFunction() async {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              Container(
                height: 5,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
              ),
              const SizedBox(height: 25),
              const Text(
                'More Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 25),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 25),
              ListTile(
                onTap: () async {
                  try {
                    Share.share('"/${widget.url}"', subject: 'short news from BB News');
                  } catch (err) {
                    await GlobalMethod.errDialogue(
                        errorMessage: 'Error: $err', context: context);
                  }
                },
                leading: const Icon(Icons.share),
                title: const Text(
                  'Share',
                  style: TextStyle(fontSize: 20, letterSpacing: .5),
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(widget.url))) {
                    throw Exception('Could not launch ${widget.url}');
                  }
                },
                leading: const Icon(Icons.link_sharp),
                title: const Text(
                  'Open in browser',
                  style: TextStyle(fontSize: 20, letterSpacing: .5),
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                onTap: () async {
                  try {
                    webViewController.reload();
                  } catch (err) {
                    log("error occured $err" as num);
                  } finally {
                    Navigator.pop(context);
                  }
                },
                leading: const Icon(Icons.refresh_sharp),
                title: const Text(
                  'Refresh',
                  style: TextStyle(fontSize: 20, letterSpacing: .5),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
