import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/developer_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData();
  }

  addData() {
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCircularChart(
            title: const ChartTitle(
              text: "Yearly Growth in the Flutter Community",
            ),
            tooltipBehavior: tooltipBehavior, // 차트 선택시 상세 데이터 보여줌
            series: <CircularSeries<DeveloperData, int>>[
              PieSeries<DeveloperData, int>(
                name: 'Developers',
                dataSource: data,
                selectionBehavior: SelectionBehavior(enable: true), // 차트 선택시 세부내용
                explode: true, // 선택시 선택한거 잘라서 보여줌
                xValueMapper: (DeveloperData developers, __) => developers.year,
                yValueMapper: (DeveloperData developers, __) => developers.developers,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ]
          ),
        ),
      ),
    );
  }
}
