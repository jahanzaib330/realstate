import 'package:flutter/material.dart';
import 'Home_Screen.dart';

class DescriptionScreen extends StatefulWidget {
  
String image;
String Price;


DescriptionScreen({required this.image, required this.Price});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.image)
              )
            ),
            
            
          ),
          Text(widget.Price)
        ],
      ),
    );
  }
}
