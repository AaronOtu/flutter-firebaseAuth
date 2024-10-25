import 'package:flutter/material.dart';

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0), 
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Rounded border for AppBar
            child: AppBar(
              backgroundColor: Colors.red,
              leading: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              flexibleSpace: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // "March" and Dropdown just above the calendar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "March",
                          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
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
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                              Text("Sun", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("Mon", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("Tue", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("Wed", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("Thu", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("Fri", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("Sat", style: TextStyle(fontSize: 16, color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                              Text("12", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("13", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("14", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("15", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("16", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("17", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Text("18", style: TextStyle(fontSize: 16, color: Colors.white)),
                            ],
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 212, 24),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
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
          // ---------------Second Container-----------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // Rounded border
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Column for the three texts
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "12:00-1:00 PM",
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                          SizedBox(height: 8.0), 
                          Text(
                            "One-to-one",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                            foregroundImage: AssetImage('images/aaron.jpg'), // Replace with your image asset
                          ),
                          Positioned(
                            left: 30, // Adjust the overlap by changing the value
                            child: CircleAvatar(
                              radius: 30,
                              foregroundImage: AssetImage('images/aaron.jpg'), // Replace with your image asset
                            ),
                          ),
                        ],
                      ),
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
                  borderRadius: BorderRadius.circular(20), 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
