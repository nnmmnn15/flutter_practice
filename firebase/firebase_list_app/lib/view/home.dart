import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_list_app/model/student.dart';
import 'package:firebase_list_app/view/insert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore List'),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const Insert()),
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance // firebase의
            .collection('students') // students 컬렉션의
            .orderBy('code', descending: false) // 코드의 asc로
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = snapshot.data!.docs;
          return ListView(
            children: documents.map((e) => buildItemWidgets(e)).toList(),
          );
        },
      ),
    );
  }

  // -- Functions --
  Widget buildItemWidgets(DocumentSnapshot doc) {
    final students = Student(
        code: doc['code'],
        name: doc['name'],
        dept: doc['dept'],
        phone: doc['phone'],
        image: doc['image']);

    return Card(
      child: ListTile(
        title: Row(
          children: [
            Image.network(
              students.image,
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                  "학번 : ${students.code} \n이름 : ${students.name}\n학과 : ${students.dept}\n전화번호 : ${students.phone}"),
            ),
          ],
        ),
      ),
    );
  }
} // End
