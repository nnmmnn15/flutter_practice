import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';
import 'package:listview_todo_ex_app/model/todo_list.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  // Property
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  addData(){
    todoList.add(TodoList(imagePath: 'images/cart.png', todoText: '책구매'));
    todoList.add(TodoList(imagePath: 'images/cart.png', todoText: '책구매'));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/add').then((value) => addTodoList(),),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(todoList[index]),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              todoList.remove(todoList[index]);
              setState(() {});
            },
            background: Container(
              // color: Colors.red,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Icon(Icons.delete),
              ),
            ),
            // secondaryBackground: Container(
            //   color: Colors.blue,
            // ),
            child: GestureDetector(
              onTap: () {
                Message.imagePath = todoList[index].imagePath;
                Message.todoText = todoList[index].todoText;
                Navigator.pushNamed(context, '/detail');
              },
              child: Card(
                
                child: Row(
                  children: [
                    Image.asset(todoList[index].imagePath),
                    Text(todoList[index].todoText),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- Function ---
  addTodoList(){
    if(Message.addAble){
      todoList.add(TodoList(imagePath: Message.imagePath, todoText: Message.todoText));
      Message.addAble = false;
    }
    setState(() {});
  }
}