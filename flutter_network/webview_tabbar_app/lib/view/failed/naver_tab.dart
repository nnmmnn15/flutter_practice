import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NaverTab extends StatefulWidget {
  const NaverTab({super.key});

  @override
  State<NaverTab> createState() => _NaverTabState();
}

class _NaverTabState extends State<NaverTab> {
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
      ..loadRequest(Uri.parse("https://www.naver.com"));
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
