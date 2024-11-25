import 'package:flutter/material.dart';
import 'package:response_layout/components/appbar_title.dart';
import 'package:response_layout/components/course_title.dart';
import 'package:response_layout/components/menu_text_button.dart';
import 'package:response_layout/components/page_header.dart';
import 'package:response_layout/components/subscribe_block.dart';
import 'package:response_layout/model/course.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> courses = Course.courses;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
        title: const AppBarTitle(),
        // 앱바의 앞부분(왼쪽)
        leading: ResponsiveVisibility(
          hiddenConditions: const [
            // 타블렛 보다 커지면 value: false = 안보이도록
            Condition.largerThan(value: false, name: TABLET)
          ],
          child: IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          const ResponsiveVisibility(
            hiddenConditions: [
              // 모바일 보다 커지면 value: true = 보이도록
              Condition.largerThan(value: true, name: MOBILE)
            ],
            child: MenuTextButton(text: 'Courses'),
          ),
          const ResponsiveVisibility(
            hiddenConditions: [
              // 모바일 보다 커지면 value: true = 보이도록
              Condition.largerThan(value: true, name: MOBILE)
            ],
            child: MenuTextButton(text: 'About'),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.mark_email_unread_rounded),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Center(
            child: PageHeader(),
          ),
          const SizedBox(
            height: 30,
          ),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowPadding: const EdgeInsets.all(30.0),
            columnPadding: const EdgeInsets.all(30),
            layout: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CourseTitle(course: courses[0]),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CourseTitle(course: courses[1]),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: SubscribeBlock(),
          )
        ],
      ),
    );
  }
}
