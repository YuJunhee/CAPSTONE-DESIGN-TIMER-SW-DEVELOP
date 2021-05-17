import 'package:flutter/material.dart';

// Reward 위젯 구현
class Reward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text(
            '리워드 위젯 샘플',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            100,
            (index) {
              return Center(
                  child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline6,
              ));
            },
          ),
        ));
  }
}
