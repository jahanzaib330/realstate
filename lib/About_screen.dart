import 'package:flutter/material.dart';

import 'Contact_Screen.dart';
import 'Home_Screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RealEstate Agency About"),
        centerTitle: true,
        elevation: 0,
        leading: Builder(builder: (context){
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.list, color: Colors.black,));
        },),

        backgroundColor: Colors.greenAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              color: Colors.lightBlueAccent,
            ),

            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

                },

              ),
            ),
            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.abc_outlined),
                title: Text("About"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutScreen()));

                },

              ),
            ),
            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contact"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactScreen()));

                },

              ),
            ),


          ],
        ),
      ),
    );
  }
}
