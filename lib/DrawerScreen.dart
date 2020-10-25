import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_ui/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 10,),
              Column(
                children: [
                  Text("Dastan", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                  Text("Active Status", style: TextStyle(fontSize: 10, color: Colors.grey,)),
                ],
              )
            ],
          ),

          Column(
            children: drawerItems.map((e) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(e['icon'], color: Colors.white, size: 30,),
                    SizedBox(width: 10,),
                    Text(e['title'], style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold, ))
                  ],
                ),
              )
            ).toList(),
          ),

          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(width: 10,),
              Text('Setting',style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 10,),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(width: 10,),
              Text("Log Out", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))

            ],
          )
        ],
      ),
    );
  }
}
