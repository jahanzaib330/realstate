import 'dart:html';

import 'package:flutter/material.dart';

class horizontalScreen extends StatefulWidget {
  const horizontalScreen({super.key});

  @override
  State<horizontalScreen> createState() => _horizontalScreenState();
}

class _horizontalScreenState extends State<horizontalScreen> {

  List names = ["Boat" , "Bike" , "Car" , "Buses" , "Truck" , "Airplane" ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SizedBox(width: double.infinity,
            height: 40,
              child: ListView.builder(
                  itemCount: names.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceIn,
                        width: 80,
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          border: currentIndex == index?Border.all(color: Colors.black54):Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(14)
                        ),
                        child: Center(
                          child: Text(names[index]),
                        ),
                      ),
                    );
                  },
              ),
            ),
          ),

          SizedBox(height: 20,),

          ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Center(
                  child: Text(names[currentIndex]),
                );
              })
        ],
      ),
    );
  }
}
