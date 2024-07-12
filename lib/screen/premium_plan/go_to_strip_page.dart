import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoToStripeWebView extends StatefulWidget {
  const GoToStripeWebView({super.key, required this.stripeUrl});

  final String stripeUrl;

  @override
  State<GoToStripeWebView> createState() => _GoToStripeWebViewState();
}

class _GoToStripeWebViewState extends State<GoToStripeWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            print("onPageFinished");
            print(url);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("line 32");
            print(request.url);
            Get.back(result: request.url);

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.stripeUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
