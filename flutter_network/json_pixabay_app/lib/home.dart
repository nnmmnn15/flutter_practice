import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:json_pixabay_app/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late TextEditingController textEditingController;
  late bool isReady;
  final api = '';

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    data = [];
    isReady = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixaBay Image검색'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 330,
                  child: TextField(
                    controller: textEditingController,
                  ),
                ),
                IconButton(
                  onPressed: () => getJsonData(),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),

            // 검색창이 비어있을때
            textEditingController.text
                    .trim()
                    .isEmpty // data.isEmpty // 빈값이 들어가도 이미지가 나옴
                ? const Flexible(
                    child: Center(
                      child: Text('검색된 이미지가 없습니다'),
                    ),
                  )
                : isReady

                    // 보여줄 준비가 되었을때
                    ? Flexible(
                        child: GridView.builder(
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.to(
                                const Detail(),
                                arguments: (
                                  textEditingController.text.trim(),
                                  data[index]["largeImageURL"]
                                ),
                              ),
                              child: Card(
                                color: Colors.grey[400],
                                child: Image.network(
                                  data[index]["webformatURL"],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    // 로딩중 일때
                    : const Flexible(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
          ],
        ),
      ),
    );
  }

  // Functions
  getJsonData() async {
    isReady = false;
    setState(() {});

    data = [];
    var url = Uri.parse(
        "https://pixabay.com/api/?key=${api}=${textEditingController.text.trim()}&image_type=photo");
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON["hits"];
    data.addAll(result);
    isReady = true;
    setState(() {});
  }
} // End
