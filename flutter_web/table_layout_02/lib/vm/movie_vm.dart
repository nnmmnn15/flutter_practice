import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_layout_02/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:table_layout_02/view/detail_view.dart';

class MovieVm extends GetxController {
  // 영화 객체 리스트
  final RxList<Movie> movieData = <Movie>[].obs;
  // 테이블 Row 리스트
  final RxList<DataRow> tableData = <DataRow>[].obs;

  @override
  void onInit() {
    super.onInit();
    getJSONData();
  }

  // JSON 파일에서 데이터 불러오기
  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON["results"];
    movieData.value = result
        .map(
          (e) => Movie(image: e['image'], title: e['title']),
        )
        .toList();

    setTableData();
  }

  setTableData() {
    for (int i = 0; i < movieData.length; i++) {
      List<DataCell> cells = [];
      cells.add(
        (DataCell(
          Image.network(
            movieData[i].image,
          ),
        )),
      );
      cells.add((DataCell(
        Text(movieData[i].title),
        onTap: () => Get.to(() => const DetailView(),
            arguments: [movieData[i].image, movieData[i].title]),
      )));
      tableData.add(DataRow(cells: cells));
    }
  }
}
