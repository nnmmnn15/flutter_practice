class Students {
  // Property
  int? seq; // Auto Increment
  String code;
  String name;
  String dept;
  String phone;

  // Constructor
  Students({
    this.seq,
    required this.code,
    required this.name,
    required this.dept,
    required this.phone,
  });

  Students.fromMap(Map<String, dynamic> res)
      : seq = res['seq'],
        code = res['code'],
        name = res['name'],
        dept = res['dept'],
        phone = res['phone'];

  factory Students.fromMap2(Map<String, dynamic> res) {
    return Students(
      seq : res['seq'],
      code : res['code'],
      name : res['name'],
      dept : res['dept'],
      phone : res['phone'],
    );
  }
}
