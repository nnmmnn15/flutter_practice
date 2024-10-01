import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:getx_crud_app/model/students.dart';
import 'package:http/http.dart' as http;

class VmHandler extends GetxController {
  var students = <Students>[].obs;

  getJSONData() async {
    students.clear();
    var url = Uri.parse('http://127.0.0.1:8000/select');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List results = dataConvertedJSON['results'];

    List<Students> returnResult = [];
    for (int i = 0; i < results.length; i++) {
      String scode = results[i][0];
      String sname = results[i][1];
      String sdept = results[i][2];
      String sphone = results[i][3];
      String? saddress = results[i][4];

      saddress ??= "__";
      returnResult.add(Students(
          scode: scode,
          sname: sname,
          sdept: sdept,
          sphone: sphone,
          saddress: saddress));
    }
    students.value = returnResult;
  }

  insertJSONData(String code, String name, String dept, String phone,
      String address) async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/insert?code=$code&name=$name&dept=$dept&phone=$phone&address=$address&');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    var results = dataConvertedJSON['results'];
    return results;
  }

  updateJSONData(String code, String name, String dept, String phone,
      String address) async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/update?code=$code&name=$name&dept=$dept&phone=$phone&address=$address&');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    var results = dataConvertedJSON['results'];
    return results;
  }

  deleteJSONData(String code) async {
    var url = Uri.parse('http://127.0.0.1:8000/delete?code=$code');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    var results = dataConvertedJSON['results'];
    return results;
  }
}
