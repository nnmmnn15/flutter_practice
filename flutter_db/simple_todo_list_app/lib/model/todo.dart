class Todo {
  int? taskId;
  String task;
  String? date;
  int? taskCheck;

  Todo({
    this.taskId,
    required this.task,
    this.date,
    this.taskCheck,
  });

  Todo.fromMap(Map<String, dynamic> res)
    : taskId = res['taskid'],
      task = res['task'],
      date = res['insertdate'],
      taskCheck = res['taskcheck'];

  // factory Todo.fromMap2(Map<String, dynamic> res) {
  //   return Todo(
  //     taskId : res['taskid'],
  //     task : res['task'],
  //     date : res['insertdate'],
  //   );
  // }
}
