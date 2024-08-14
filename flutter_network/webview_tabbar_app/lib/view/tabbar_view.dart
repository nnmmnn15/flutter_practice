import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/view/web_view.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({super.key});

  @override
  State<TabbarView> createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          WebView(siteUri: 'https://www.naver.com'),
          WebView(siteUri: 'https://www.google.com'),
          WebView(siteUri: 'https://www.daum.com'),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.deepPurple[100],
        height: 100,
        child: TabBar(
          controller: tabController,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          tabs: [
            Tab(
              icon: Image.asset('images/naver.png',width: 30,),
              text: '네이버',
            ),
            Tab(
              icon: Image.asset('images/chrome.png',width: 30,),
              text: '구글',
            ),
            Tab(
              icon: Image.asset('images/daum.jpeg',width: 30,),
              text: '다음',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        aaa();
      },),
    );
  }
  aaa(){
    print(tabController.index);
  }
}
