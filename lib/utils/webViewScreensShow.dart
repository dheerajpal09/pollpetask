import 'package:flutter/material.dart';
import 'package:pollpetask/utils/appBarScreen.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreensShow extends StatefulWidget {
  final String url;
  const WebViewScreensShow({super.key, required this.url});

  @override
  State<WebViewScreensShow> createState() => _WebViewScreensShowState();
}

class _WebViewScreensShowState extends State<WebViewScreensShow> {
  // late InAppWebViewController _webViewController;
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBarScreens()),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
          if (loadingPercentage < 100)
            Center(
              child: CircularProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
            ),
        ],
      ),
    );
  }
}
