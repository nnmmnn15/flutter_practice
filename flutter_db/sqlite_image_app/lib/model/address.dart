import 'dart:typed_data';

class Address {
  final int? id;
  final String name;
  final String phone;
  final String address;
  final String relation;
  final Uint8List image; // Image Type

  // flutter에서 데이터를 저장할때
  Address(
      {this.id,
      required this.name,
      required this.phone,
      required this.address,
      required this.relation,
      required this.image});

  // DB에서 데이터를 불러올 때
  Address.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        phone = res['phone'],
        address = res['address'],
        relation = res['relation'],
        image = res['image'];
}
