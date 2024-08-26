import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Position currentPosition;
  late double latData; // 위도데이터
  late double longData; // 경도데이터
  late MapController mapController;
  late bool canRun;
  late List subwayLocate;
  double dislat = 0;
  double dislong = 0;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    canRun = false;
    subwayLocate = [];
    getJSONData();
    checkLocationPermission();
  }

  getJSONData() async {
    var url = Uri.parse(
        'https://t-data.seoul.go.kr/apig/apiman-gateway/tapi/TaimsKsccDvSubwayStationGeom/1.0?apikey=32aad733-b751-428e-bea8-5f6909717772');
    var response = await http.get(url);
    // print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    subwayLocate.addAll(dataConvertedJSON);
    setState(() {});
  }

  checkLocationPermission() async {
    // 사용자가 권한 선택 전까지 대기
    LocationPermission permission = await Geolocator.checkPermission();
    // 거부 시
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }
    // 사용하는 동안, 항상 허용
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      getCurrentLocation();
    }
  }

  getCurrentLocation() async {
    // 학원 위치 : 37.4973294 / 127.0293198
    //37.5017372,127.0260916
    Position position = await Geolocator.getCurrentPosition();
    currentPosition = position;
    canRun = true;
    latData = currentPosition.latitude;
    longData = currentPosition.longitude;
    print("$latData, $longData");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('GPS & Map'),
              )
            ],
          ),
        ),
      ),
      body: canRun
          ? flutterMap()
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => calcDis(),
      ),
    );
  }

  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
          initialCenter: latlng.LatLng(latData, longData), initialZoom: 17.0),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: List.generate(
            subwayLocate.length + 1,
            (index) => index == subwayLocate.length 
            // 현재 위치
            ? Marker(
            width: 80,
            height: 80,
            point: latlng.LatLng(latData, longData),
            child: const Column(
              children: [
                SizedBox(
                  child: Text(
                    '현재위치',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Icon(
                  Icons.pin_drop,
                  size: 50,
                  color: Colors.red,
                )
              ],
            ),
          )
          // 전체 위치
            : 
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(
                double.parse(subwayLocate[index]["convY"]),
                double.parse(subwayLocate[index]["convX"]),
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      '${subwayLocate[index]["stnKrNm"]}역',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.pin_drop,
                    size: 50,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  // MarkerLayer(
  //         markers: [
  //           Marker(
  //             width: 80,
  //             height: 80,
  //             point: latlng.LatLng(latData, longData),
  //             child: const Column(
  //               children: [
  //                 SizedBox(
  //                   child: Text(
  //                     '현재위치',
  //                     style: TextStyle(
  //                       fontSize: 10,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //                 Icon(
  //                   Icons.pin_drop,
  //                   size: 50,
  //                   color: Colors.red,
  //                 )
  //               ],
  //             ),
  //           ),
  //           Marker(
  //             width: 80,
  //             height: 80,
  //             point: latlng.LatLng(dislat, dislong),
  //             child: const Column(
  //               children: [
  //                 SizedBox(
  //                   child: Text(
  //                     '최단거리',
  //                     style: TextStyle(
  //                       fontSize: 10,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //                 Icon(
  //                   Icons.pin_drop,
  //                   size: 50,
  //                   color: Colors.blue,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       )

  // calcDistanc(){
  //   double shortestPath = 1000000000; // 최단경로
  //   int shortIndex = 0;
  //   const latlng.Distance distance = latlng.Distance();
  //   double dis = 0;

  //   for (int i = 0; i < subwayLocate.length; i++) {
  //     print(shortestPath);
  //     // 거리 계산
  //     final double meterDistance = distance.as(
  //       latlng.LengthUnit.Meter,
  //       latlng.LatLng(latData, longData),
  //       latlng.LatLng(
  //         double.parse(subwayLocate[i]["convX"]),
  //         double.parse(subwayLocate[i]["convY"]),
  //       ),
  //     );
  //     if (shortestPath > meterDistance) {
  //       shortestPath = meterDistance;
  //       dis = meterDistance;
  //       dislong = double.parse(subwayLocate[i]["convX"]);
  //       dislat = double.parse(subwayLocate[i]["convY"]);
  //       print('$dislat , $dislong');
  //       shortIndex = i;
  //     }
  //   }
  //   setState(() {});
  //   print('$dislat , $dislong');
  //   print(
  //       "${subwayLocate[shortIndex]["stnKrNm"]}역, ${subwayLocate[shortIndex]["lineNm"]} 입니다, $dis");
  // }

  // // 거리 계산
  // calcA(lt1, lng1, lt2, lng2) {
  //   var p = 0.017453292519943295;
  //   var c = cos;
  //   var a = 0.5 -
  //       c((lt2 - lt1) * p) / 2 +
  //       c(lt1 * p) * c(lt2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
  //   return 12742 * asin(sqrt(a));
  // }

  calcDis() async {
    int shortIndex = 0;
    double shortestMeter = 1;
    for (int i = 0; i < subwayLocate.length; i++) {
      // 거리 계산
      dislong = double.parse(subwayLocate[i]["convX"]);
      dislat = double.parse(subwayLocate[i]["convY"]);
      double distanceX = (dislong - longData).abs();
      double distanceY = (dislat - latData).abs();
      double distance = distanceX + distanceY;
      if (distance < shortestMeter) {
        shortestMeter = distance;
        shortIndex = i;
      }
    }

    dislong = double.parse(subwayLocate[shortIndex]["convX"]);
    dislat = double.parse(subwayLocate[shortIndex]["convY"]);
    return shortIndex;
  }
}
