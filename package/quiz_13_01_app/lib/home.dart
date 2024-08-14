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
  late MapController mapController;
  late bool canRun;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    canRun = false;
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
    canRun = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: canRun
          ? flutterMap()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // -- Widget --
  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: const MapOptions(
          initialCenter: latlng.LatLng(37.5917738, 126.9923837),
          initialZoom: 13.0),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        const MarkerLayer(
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5878892, 127.0037098),
              child: Column(
                children: [
                  Text(
                    '혜화문',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 40,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5711907, 127.009506),
              child: Column(
                children: [
                  Text(
                    '흥인지문',
                    style: TextStyle(
                        color: Color.fromARGB(255, 67, 67, 67),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 40,
                    color: Color.fromARGB(255, 67, 67, 67),
                  ),
                ],
              ),
            ),
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5926027, 126.9664771),
              child: Column(
                children: [
                  Text(
                    '창의문',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 40,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5956584, 126.9810576),
              child: Column(
                children: [
                  Text(
                    '숙정문',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 40,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
