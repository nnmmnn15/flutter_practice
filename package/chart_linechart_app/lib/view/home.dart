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
        title: const Text('Line Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: const ChartTitle(
              text: "Yearly Growth in the Flutter Community",
            ),
            tooltipBehavior: tooltipBehavior, // 차트 선택시 상세 데이터 보여줌
            series: [
              LineSeries<DeveloperData, int>( // int 는 형식이므로 맞춰줘야함 (나중에 index로 대체)
                color: Theme.of(context).colorScheme.primary,
                name: 'Developers',
                dataSource: data,
                xValueMapper: (DeveloperData developers, _) => developers.year, 
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: const DataLabelSettings(isVisible: true), // 차트 상단의 수치 표기
                enableTooltip: true,
              ),
            ],
            // x축 타이틀 (xlabel)
            primaryXAxis: const CategoryAxis(
              title: AxisTitle(text: '년도'),
            ),
            // y축 타이틀 (ylabel)
            primaryYAxis: const CategoryAxis(
              title: AxisTitle(text: '인원수')
            ),
          ),
        ),
      ),
    );
  }
}
