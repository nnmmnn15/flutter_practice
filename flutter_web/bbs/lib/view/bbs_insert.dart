import 'package:bbs/components/web_txt_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class BbsInsert extends StatefulWidget {
  const BbsInsert({super.key});

  @override
  State<BbsInsert> createState() => _BbsInsertState();
}

class _BbsInsertState extends State<BbsInsert> {
  late TextEditingController nameEditingController;
  late TextEditingController titleEditingController;
  late TextEditingController contentEditingController;

  @override
  void initState() {
    super.initState();
    nameEditingController = TextEditingController();
    titleEditingController = TextEditingController();
    contentEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '게시글 작성',
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: const Icon(Icons.edit_note),
        actions: [
          responsive.ResponsiveVisibility(
            hiddenConditions: const [
              responsive.Condition.largerThan(
                value: true,
                name: responsive.MOBILE,
              ),
            ],
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () => Get.to(() => const BbsInsert(),
                  transition: Transition.noTransition),
              child: const Text(
                '게시판으로 이동',
              ),
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => const BbsInsert(),
                transition: Transition.noTransition),
            icon: const Icon(Icons.format_list_bulleted),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              WebTxtFeild(
                  controller: nameEditingController, labelString: '이름을 입력하세요'),
              WebTxtFeild(
                  controller: titleEditingController, labelString: '제목을 입력하세요'),
              WebTxtFeild(
                controller: contentEditingController,
                labelString: '내용을 입력하세요',
                h: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
