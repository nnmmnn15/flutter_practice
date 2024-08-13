import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlng;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late Position currentPosition;
  late int kindChoice; // Segment tool bar
  late double latData; // 위도데이터
  late double longData; // 경도데이터
  late MapController mapController;
  late bool canRun; // 지도를 그리기 위한 준비가 완료되었는지 여부
  late List location;

  // SegMent Widget
  Map<int, Widget> segmentWidgets = {
    0: const SizedBox(
      child: Text(
        '현위치',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    1: const SizedBox(
      child: Text(
        '둘리뮤지엄',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    2: const SizedBox(
      child: Text(
        '  서대문형무소역사관  ',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    kindChoice = 0;
    mapController = MapController();
    canRun = false;
    location = ['현재 위치', '둘리 뮤지엄', '서대문 형무소 역사관'];
    checkLocationPermission();
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
    Position position = await Geolocator.getCurrentPosition();
    currentPosition = position;
    canRun = true;
    latData = currentPosition.latitude;
    longData = currentPosition.longitude;
    // print("$latData, $longData");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('GPS & Map'),
              ),
              CupertinoSegmentedControl(
                groupValue: kindChoice,
                children: segmentWidgets,
                onValueChanged: (value) {
                  kindChoice = value;
                  if (kindChoice == 0) {
                    getCurrentLocation();
                    latData = currentPosition.latitude;
                    longData = currentPosition.longitude;
                    mapController.move(
                      latlng.LatLng(latData, longData),
                      17.0,
                    );
                  } else if (kindChoice == 2) {
                    latData = 37.65243153;
                    longData = 127.0276397;
                    mapController.move(
                      latlng.LatLng(latData, longData),
                      17.0,
                    );
                  } else {
                    latData = 37.57244171;
                    longData = 126.9595412;
                    mapController.move(
                      latlng.LatLng(latData, longData),
                      17.0,
                    );
                  }
                  setState(() {});
                },
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
    );
  }

  // -- Widgets --
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
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(latData, longData),
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      location[kindChoice],
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
                    color: Colors.red,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
} // END
