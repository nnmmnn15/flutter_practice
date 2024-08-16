import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String stationName;
  late List data;
  late TextEditingController textEditingController;
  final api = '';

  @override
  void initState() {
    super.initState();
    stationName = "";
    textEditingController = TextEditingController();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seoul Subway'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: textEditingController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      stationName = textEditingController.text.trim();
                      getJSONData();
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            Flexible(
              child: data.isNotEmpty
              ? ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: index % 2 == 0 ? Colors.brown[100] : Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '열차 구분 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["updnLine"],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  '열차 방면 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["trainLineNm"],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  '현재 위치 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["arvlMsg3"],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  '도착 시간 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["arvlMsg2"],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
              : const Center(child: Text('역이 잘못 입력되었습니다'),),
            )
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  getJSONData() async {
    data.clear();
    var url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/${api}/json/realtimeStationArrival/1/5/$stationName');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    // print(dataConvertedJSON["errorMessage"]);
    if (dataConvertedJSON["errorMessage"] != null) {
      List realtimeArrivalList = dataConvertedJSON["realtimeArrivalList"];
      data = realtimeArrivalList;
    }
    setState(() {});
  }
} // End
