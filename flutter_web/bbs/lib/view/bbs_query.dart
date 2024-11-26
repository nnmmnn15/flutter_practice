import 'dart:convert';

import 'package:bbs/view/bbs_edit.dart';
import 'package:bbs/view/bbs_insert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class BbsQuery extends StatefulWidget {
  const BbsQuery({super.key});

  @override
  State<BbsQuery> createState() => _BbsQueryState();
}

class _BbsQueryState extends State<BbsQuery> {
  // Property
  late List data;
  late int startRow;
  late int endRow;

  @override
  void initState() {
    super.initState();
    data = [];
    startRow = 1; // paging
    endRow = 8; // paging
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          children: [
            Icon(Icons.format_list_bulleted),
            Text(
              '   게시판',
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.onTertiary,
        actions: [
          responsive.ResponsiveVisibility(
            hiddenConditions: const [
              responsive.Condition.largerThan(
                value: true,
                name: responsive.MOBILE,
              ),
            ],
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () => Get.to(() => const BbsInsert(),
                      transition: Transition.noTransition)!
                  .then(
                (value) => reloadData(),
              ),
              child: const Text(
                '게시글 작성',
              ),
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => const BbsInsert(),
                    transition: Transition.noTransition)!
                .then((value) => reloadData()),
            icon: const Icon(Icons.edit_note),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              '게시판 검색',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: data.isEmpty
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        DataTable(
                          columns: const [
                            DataColumn(
                              label: SizedBox(
                                width: 30,
                                child: Text(
                                  '순서',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 30,
                                child: Text(
                                  'Key',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 40,
                                child: Text(
                                  '작성자',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 30,
                                child: Text(
                                  '제목',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 60,
                                child: Text(
                                  '작성일자',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: getRows(),
                        ),
                        // Paging
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                startRow -= 8;
                                endRow -= 8;
                                if (startRow <= 0) {
                                  startRow = 1;
                                  endRow = 8;
                                }
                                setState(() {});
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            Text(
                                '$startRow ~ ${endRow >= data.length ? data.length : endRow} / ${data.length}'),
                            IconButton(
                              onPressed: () {
                                startRow += 8;
                                endRow += 8;
                                if (endRow > data.length + 7) {
                                  startRow -= 8;
                                  endRow -= 8;
                                }
                                setState(() {});
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Function ---
  getJSONData() async {
    var url = Uri.parse('http://127.0.0.1:8000/select');
    var response = await http.get(url);

    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data.addAll(result);
    setState(() {});
  }

  reloadData() {
    data.clear();
    getJSONData();
  }

  List<DataRow> getRows() {
    List<DataRow> dataRow = [];

    for (int i = 0; i < data.length; i++) {
      // startRow 부터 endRow까지만 보여줌
      if (i + 1 >= startRow && i + 1 <= endRow) {
        List<DataCell> cells = [];
        cells.add(DataCell(Text((i + 1).toString())));
        cells.add(DataCell(Text(data[i]['bId'].toString())));
        cells.add(DataCell(Text(data[i]['bName'])));
        cells.add(DataCell(
          onTap: () {
            Get.to(() => const BbsEdit(),
                    arguments: [
                      data[i]['dID'],
                      data[i]['dName'],
                      data[i]['dTitle'],
                      data[i]['dContent'],
                    ],
                    transition: Transition.noTransition)!
                .then((value) => reloadData());
          },
          Text(data[i]['bTitle']),
        ));
        cells.add(DataCell(Text(data[i]['bDate'])));
        dataRow.add(DataRow(cells: cells));
      }
    }
    return dataRow;
  }
} // End
