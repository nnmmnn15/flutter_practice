import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:getx_json_movie_github_app/model/movie.dart';
import 'package:http/http.dart' as http;

class VmHandler extends GetxController {
  var movies = <Movie>[].obs;

  getJSONData() async {
    var url = Uri.parse("https://zeushahn.github.io/Test/movies.json");
    var response = await http.get(url);
    var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
    List results = dataConvertedJSON['results'];

    List<Movie> returnResult = [];
    for (int i = 0; i < results.length; i++) {
      String title = results[i]['title'];
      String image = results[i]['image'];
      returnResult.add(Movie(image: image, title: title));
    }

    movies.value = returnResult;
  }
}
