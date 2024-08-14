import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List studentData;

  @override
  void initState() {
    super.initState();
    studentData = [];
    getJSONData();
  }

  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/student.json');
    var response = await http.get(url);
    // print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON["results"];
    studentData.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: studentData.isEmpty
      ? const CircularProgressIndicator()
      : Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: studentData.length,
            itemBuilder: (context, index) {
              return Card(
                color: deptColor(studentData[index]["dept"]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '이름 : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '학과 : ',
                            ),
                            Text(
                              '학번 : ',
                            ),
                            Text(
                              '전화번호 : ',
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              studentData[index]['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              studentData[index]['dept'],
                            ),
                            Text(
                              studentData[index]['code'],
                            ),
                            Text(
                              studentData[index]['phone'],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
      ),
    );
  }

  // --- Function ---
  Color? deptColor(dept){
    switch(dept){
      case "컴퓨터공학과":
        return Colors.grey;
      case "국문학과":
        return Colors.brown[100];
      case "사학과":
        return Colors.orange[100];
      default:
        return Colors.white;
    }
  }
}
