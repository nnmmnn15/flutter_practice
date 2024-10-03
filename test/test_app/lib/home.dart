import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  LikeButton(
                    isLiked: true,
                    likeCount: 665, // 현재 좋아요 숫자
                    countBuilder: (count, isLiked, text) {
                      var color =
                          isLiked ? Colors.deepPurpleAccent : Colors.grey;
                      Widget result;
                      if (count == 0) {
                        result = Text(
                          "love",
                          style: TextStyle(color: color),
                        );
                      } else {
                        result = Text(
                          text,
                          style: TextStyle(color: color),
                        );
                      }
                      return result;
                    },
                  ),
                  Card(
                    child: const Text('data'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
