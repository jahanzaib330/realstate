import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:realestate/firebase_firestore/insert_Screen.dart';


class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20,),

            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("userData").snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    var dataLength = snapshot.data!.docs.length;
                    return dataLength==0?Center(
                      child: Text("Nothing To Show"),
                    ):ListView.builder(
                        itemCount: dataLength,
                        shrinkWrap: true,
                        itemBuilder: (context, index){

                          String userId = snapshot.data!.docs[index].id;
                          String userName = snapshot.data!.docs[index]['User-Name'];
                          String userEmail = snapshot.data!.docs[index]['User-Email'];
                          String userPassword = snapshot.data!.docs[index]['User-Contact'];

                          return GestureDetector(
                            onLongPress: ()async{
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext dialogcontext){
                                    return AlertDialog(
                                      title: Text("Delete USer"),
                                      content: Text("Are You sure you want to dalete $userName"),
                                      actions: <Widget>[
                                        TextButton(
                                    child: Text('Delete'),
                                          onPressed: () async{
                                      await FirebaseFirestore.instance.collection("userData").doc(userId).delete();
                                      Navigator.of(dialogcontext)
                                      .pop();


                                        }, ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Container(
                                margin: EdgeInsets.only(left: 14, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("User_Name: $userName" , style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                    ),),

                                    Text("User_Email: $userEmail" , style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18
                                    ),),

                                    Text("User_Password: $userPassword" , style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                          );

                        });
                  }  if (snapshot.hasError) {
                    return Icon(Icons.error_outline);
                  }
                return Container();
                }),

            SizedBox(height: 20,),

            Center(
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => InsertScreem(),));
              }, child: Text("Add Data"),),
            )
          ],
        ),
      ),
    );
  }
}
