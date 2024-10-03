class Memo {
  String id;
  String title;
  String content;

  Memo({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Memo.fromMap(Map<String, dynamic> map, String id) {
    return Memo(
      id: id, // doc의 id
      title: map['title'] ?? "",
      content: map['content'] ?? "",
    );
  }
}
