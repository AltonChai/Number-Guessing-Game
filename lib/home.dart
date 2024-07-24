import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Title",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              //the top 4 circle

              children: List.generate(
                4,
                (index) => Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              //what is this
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                children: List.generate(
                  10,
                  (index) => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      index < 9 ? '${index + 1}' : '0',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
