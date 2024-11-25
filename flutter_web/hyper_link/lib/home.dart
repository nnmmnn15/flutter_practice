import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Url Launcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            urlLink('www.naver.com', "Naver"),
            urlLink('www.google.com', "Google"),
            urlLink('www.daum.net', "Daum"),
          ],
        ),
      ),
    );
  }

  // --- Function ---
  launchURL(urlLocation) async {
    Uri url = Uri.parse("http://$urlLocation");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  urlLink(url, String siteName) {
    return InkWell(
      onTap: () {
        String urlLocation = url;
        launchURL(urlLocation);
      },
      child: Text(
        '$siteName Link',
        style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue),
      ),
    );
  }
}
