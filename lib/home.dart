import 'package:flutter/material.dart';

class HomwPage extends StatefulWidget {
  const HomwPage({super.key});

  @override
  State<HomwPage> createState() => _HomwPageState();
}

class _HomwPageState extends State<HomwPage> {
  //set answer
  String answer = "0000";
  //create list to store number
  List<int?> alreadypresspunyanumber = [null, null, null, null];
  void pressedNumber(int index, int number) {
    setState(
      () {
        alreadypresspunyanumber[index] = number;
        checkanswer();
      },
    );
  }

  void checkanswer() {
    //wtf is this lmao pls explain
    String inputnumber = alreadypresspunyanumber
        .map((e) => e != null ? e.toString() : '0')
        .join('');
    if (inputnumber.length == 4 && inputnumber != answer) {
      //delay one second and clear the number
      Future.delayed(
        const Duration(seconds: 1),
        () {
          setState(
            () {
              alreadypresspunyanumber = [null, null, null, null];
            },
          );
        },
      );
    } else if (inputnumber.length == 4 && inputnumber == answer) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          setState(
            () {
              alreadypresspunyanumber = [null, null, null, null];
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "Guess",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 92, bottom: 25),
              child: Row(
                // the top 4 circles
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        alreadypresspunyanumber[index]?.toString() ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: List.generate(
                    10,
                    (index) => GestureDetector(
                      onTap: () {
                        print("Button ${index < 9 ? index + 1 : 0} pressed");

                        for (int i = 0; i < 4; i++) {
                          if (alreadypresspunyanumber[i] == null) {
                            pressedNumber(i, index < 9 ? index + 1 : 0);
                            break;
                          }
                        }
                      },
                      child: CircleAvatar(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
