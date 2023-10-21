import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class InsertScreem extends StatefulWidget {
  const InsertScreem({super.key});

  @override
  State<InsertScreem> createState() => _InsertScreemState();
}

class _InsertScreemState extends State<InsertScreem> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController cont = TextEditingController();


  void userInsert()async{
    String userId = Uuid().v1();


      Map<String, dynamic> userDetail = {
        "User-Id": userId,
        "User-Name": name.text.toString(),
        "User-Email": email.text.toString(),
        "User-Contact": cont.text.toString(),
        "User-Age": age.text.toString(),
      };
      // await FirebaseFirestore.instance.collection("userData").add(userDetail);
    await FirebaseFirestore.instance.collection("userData").doc(userId).set(userDetail);
    }




  var _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    email.dispose();
    age.dispose();
    cont.dispose();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.grey[300],
        body:
        SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,

            child: Column(
              children: [
                Form(
                    key: _formkey,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 50,),
                          //Logo
                          Icon(Icons.lock_outlined,
                            size: 100,
                          ),

                          SizedBox(height: 50,),

                          Text('Welcome to Inser Page', style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,

                          ),),

                          SizedBox(height: 25,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: name,
                              validator: (value){
                                if(value == null || value.isEmpty || value == " "){
                                  return "Name is Required";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("Enter Your Name"),
                                hintText: "Your Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),

                          SizedBox(height: 25,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: email,
                              validator: (value){
                                if(value == null || value.isEmpty || value == " "){
                                  return "Email is Required";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("Enter Your Email"),
                                hintText: "Your Email",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),

                          SizedBox(height: 25,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: age,
                              validator: (value){
                                if(value == null || value.isEmpty || value == " "){
                                  return "age is Required";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("Enter Your age"),
                                hintText: "Your age",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                prefixIcon: Icon(Icons.border_inner_rounded),
                              ),
                            ),
                          ),



                          SizedBox(height: 20,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: cont,
                              validator: (value){
                                if(value == null || value.isEmpty || value == " "){
                                  return "contact is required";
                                }
                              },

                              decoration: InputDecoration(
                                label: Text("Enter Your Contact"),
                                hintText: "Your Contact",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                prefixIcon: Icon(Icons.contact_mail),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),



                          ElevatedButton(onPressed: (){
                            if (_formkey.currentState!.validate()){
                              userInsert();
                              print(name.text.toString());
                              print(email.text.toString());
                              print(cont.text.toString());
                              print(age.text.toString());
                              name.clear();
                              email.clear();
                              cont.clear();
                              age.clear();
                            }
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage() ));

                          },
                              child: Text("Register" , style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontSize: 35,


                              ),))




                        ],
                      ),
                    )
                ),
              ],
            )

        )


    );

  }
}
