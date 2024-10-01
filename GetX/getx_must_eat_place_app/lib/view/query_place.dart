import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx_must_eat_place_app/view/insert_place.dart';
import 'package:getx_must_eat_place_app/view/update_place.dart';
import 'package:getx_must_eat_place_app/vm/vm_handler.dart';

class QueryPlace extends StatelessWidget {
  const QueryPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.put(VmHandler());

    return Scaffold(
      appBar: AppBar(
        title: const Text('내가 경험한 맛집 리스트'),
        actions: [
          IconButton(
            onPressed: () => Get.to(
              () => InsertPlace(),
            )!
                .then((value) => vmHandler.queryAddress()),
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.queryAddress(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error : ${snapshot.error}'));
              } else {
                return Obx(
                  () {
                    return ListView.builder(
                      itemCount: vmHandler.addresses.length,
                      itemBuilder: (context, index) {
                        final address = vmHandler.addresses[index];
                        return GestureDetector(
                          onTap: () => Get.to(
                            () => UpdatePlace(),
                            arguments: address,
                          )!
                              .then(
                            (value) {
                              vmHandler.imageFile = null;
                              controller.queryAddress();
                            },
                          ),
                          child: Slidable(
                            endActionPane: ActionPane(
                              extentRatio: .3,
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  flex: 2,
                                  onPressed: (context) async {
                                    await controller.deleteAddress(address.id!);
                                    controller.queryAddress();
                                  },
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: '삭제',
                                ),
                              ],
                            ),
                            child: Card(
                              child: Row(
                                children: [
                                  Image.memory(
                                    address.image,
                                    width: 100,
                                    height: 80,
                                  ),
                                  Column(
                                    children: [
                                      Text('명칭 : ${address.name}'),
                                      Text('전화번호 : ${address.phone}'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
