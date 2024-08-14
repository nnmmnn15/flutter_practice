import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DaumTab extends StatefulWidget {
  const DaumTab({super.key});

  @override
  State<DaumTab> createState() => _DaumTabState();
}

class _DaumTabState extends State<DaumTab> {
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
      ..loadRequest(Uri.parse("https://www.daum.com"));
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