import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late List<String> todoList;
  late List<int> numList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    numList = [];
    addData();
    addNumData(1000);
  }

  addData(){
    todoList.add('James');
    todoList.add('Cathy');
    todoList.add('Martin');
    todoList.add('유비');
    todoList.add('관우');
    todoList.add('장비');
    todoList.add('조조');
    todoList.add('여포');
    todoList.add('동탁');
  }

  addNumData(int num){
    for(int i = 1; i<=num; i++){
      numList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: ListView.builder(
        // itemCount: todoList.length,
        itemCount: numList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 65,
            child: Card(
              color: (index + 1) % 10 ==0 ? Colors.red : Colors.yellow,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (index + 1) % 2 == 0 ? const Icon(Icons.call) : const Icon(Icons.call_end),

                    Text(
                      // todoList[index],
                      '번호:\n ${numList[index].toString()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}