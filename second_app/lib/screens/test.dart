import 'package:flutter/material.dart';

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    List<String> dateOfWeek = ["12", "13", "14", "15", "16", "17", "18"];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(20), // Rounded border for AppBar
            child: AppBar(
              backgroundColor: Colors.red,
              leading: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // "March" and Dropdown just above the calendar
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(width: 8),
                        Text(
                          "March",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.expand_more_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  // Calendar layout
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: daysOfWeek.map((day) {
                              return Text(
                                day,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: dateOfWeek.map((day) {
                              return Text(
                                day,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                CircleAvatar(
                  radius: 20,
                  foregroundImage: AssetImage('images/aaron.jpg'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // -------------- first container ----------------------
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 212, 24),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Team Meeting",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Discussing the project with the team",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  // -------Floating Action ----------
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.black,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          // ---------------SECOND CONTAINER-----------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // Rounded border
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // text columns
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "12:00-1:00 PM",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "One-to-one",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "Repeats every two weeks",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),

                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                foregroundImage: AssetImage(
                                    'images/aaron.jpg'), // Replace with your image asset
                              ),
                              Positioned(
                                left:
                                    30, // Adjust the overlap by changing the value
                                child: CircleAvatar(
                                  radius: 30,
                                  foregroundImage: AssetImage(
                                      'images/aaron.jpg'), 
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Today")),
                             const SizedBox(width: 8),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("1h")),
                              const SizedBox(width:147),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.black,
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.north_east,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //--------third container------------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // Rounded border
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // text columns
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "1:00-2:30 PM",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "PM Meeting",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "Discussion of tasks for the month",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),

                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                foregroundImage: AssetImage(
                                    'images/aaron.jpg'), // Replace with your image asset
                              ),
                              Positioned(
                                left:
                                    30, // Adjust the overlap by changing the value
                                child: CircleAvatar(
                                  radius: 30,
                                  foregroundImage: AssetImage(
                                      'images/aaron.jpg'), // Replace with your image asset
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Today")),
                              const SizedBox(width: 8),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("1h 30m")),
                              const SizedBox(width: 117),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.black,
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.north_east,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
