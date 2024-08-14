import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String siteUri;
  const WebView({super.key, required this.siteUri});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late WebViewController controller;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        // 값 받아오기
        // 진행 중
        onProgress: (progress) {
          isLoading = true;
          setState(() {});
        },
        // 시작함
        onPageStarted: (url) {
          isLoading = true;
          setState(() {});
        },
        // 종료
        onPageFinished: (url) {
          isLoading = false;
          setState(() {});
        },
        onWebResourceError: (error) {
          isLoading = false;
          setState(() {});
        },
      ))
      ..loadRequest(Uri.parse(widget.siteUri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // loading이 true일때 circularProgressIndicator 회전
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : WebViewWidget(
                  controller: controller,
                )
        ],
      ),
    );
  }
}