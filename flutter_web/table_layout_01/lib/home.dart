import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_layout_01/model/student.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];
  @override
  void initState() {
    super.initState();
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table'),
      ),
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(
              label: SizedBox(
                width: 50,
                child: Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 50,
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 50,
                child: Text(
                  'Dept',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 50,
                child: Text(
                  'Phone',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
          rows: getRows(),
          // List.generate(
          //   data.length,
          //   (index) {
          //     return DataRow(
          //       cells: [
          //         DataCell(Text(data[index].code)),
          //         DataCell(Text(data[index].name)),
          //         DataCell(Text(data[index].dept)),
          //         DataCell(Text(data[index].phone)),
          //       ],
          //     );
          //   },
          // ),
        ),
      ),
    );
  }

  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/student.json');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON["results"];
    data.addAll(result);
    // data = result
    //     .map(
    //       (e) => Student(
    //           code: e['code'],
    //           phone: e['phone'],
    //           name: e['name'],
    //           dept: e['dept']),
    //     )
    //     .toList();
    setState(() {});
  }

  List<DataRow> getRows() {
    List<DataRow> dataRow = [];
    for (int i = 0; i < data.length; i++) {
      List<DataCell> cells = [];
      cells.add((DataCell(Text(data[i]['code']))));
      cells.add((DataCell(Text(data[i]['name']))));
      cells.add((DataCell(Text(data[i]['dept']))));
      cells.add((DataCell(Text(data[i]['phone']))));
      dataRow.add(DataRow(cells: cells));
    }
    return dataRow;
  }
}
