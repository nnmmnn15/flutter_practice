import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  final String REST_API_KEY = '';

  @override
  void initState() {
    super.initState();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kakao Rest API Exercise'),
      ),
      body: data.isEmpty
          ? const Center(
              child: Text(
                '데이터가 없습니다.',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Image.network(
                        data[index]["thumbnail"],
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data[index]["authors"]}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data[index]["sale_price"]}',
                            ),
                            Text(
                              '${data[index]["status"]}',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getCorona19Data(),
        child: const Icon(Icons.download),
      ),
    );
  }

  getCorona19Data() async {
    var url = Uri.parse(
        "https://dapi.kakao.com/v3/search/book?target=title&query=코로나19");
    var response = await http
        .get(url, headers: {"Authorization": "KakaoAK ${REST_API_KEY}"});
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    // print(dataConvertedJSON);
    List documents = dataConvertedJSON["documents"];
    data = documents;
    setState(() {});
  }
}
