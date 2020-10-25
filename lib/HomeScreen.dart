import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_ui/configuration.dart';
import 'package:pet_ui/screen2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  IconButton iconButton;

  Widget openDrawer() {
    return IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          setState(() {
            xOffset = 230;
            yOffset = 150;
            scaleFactor = 0.6;
            isDrawerOpen = true;
          });
        });
  }

  Widget closeDrawer() {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined),
        onPressed: () {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            scaleFactor = 1;
            isDrawerOpen = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),

          //Menu Button and Location Tab
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen ? closeDrawer() : openDrawer(),
                Column(
                  children: [
                    Text('Location'),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: primaryGreen,
                        ),
                        Text('Odisha,India'),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: primaryGreen,
                )
              ],
            ),
          ),

          // Search Option
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search_rounded),
                Text("Search Pet to adopt"),
                Icon(Icons.settings),
              ],
            ),
          ),

          // Pet Menu
          Container(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: shadowList,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            categories[index]['iconPath'],
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Text(
                          categories[index]['name'],
                        ),
                      ],
                    ),
                  );
                }),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 200,
              child: Row(
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: shadowList,
                        ),
                      ),
                      Align(
                        child: Hero(
                            tag: 1, child: Image.asset('images/pet-cat1.png')),
                      )
                    ],
                  )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 60, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sola',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Icon(Icons.search_off),
                              ],
                            ),
                            Text(
                              "Abyssian Cat",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text('2Yrs old',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: primaryGreen,),
                                Text(
                                  "Distance: 450 Km",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            child: Row(
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: shadowList,
                      ),
                    ),
                    Align(
                      child: Image.asset('images/pet-cat2.png'),
                    )
                  ],
                )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 60, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadowList,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chhola',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(Icons.search_off),
                            ],
                          ),
                          Text(
                            "Abyssian Cat",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('7Yrs old',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: primaryGreen,),
                              Text(
                                "Distance: 130 Km",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
