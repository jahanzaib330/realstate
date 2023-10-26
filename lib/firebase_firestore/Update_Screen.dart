import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Fetch_Screen.dart';

class UpdateScreen extends StatefulWidget {
  String uid;
  String u_name;
  String u_email;
  String u_age;
  String u_contact;

  UpdateScreen(
      {required this.uid,
      required this.u_name,
      required this.u_email,
      required this.u_age,
      required this.u_contact});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController cont = TextEditingController();

  void userupdate() async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(widget.uid)
        .update({
      "User-Id": widget.uid,
      "User-Name": name.text.toString(),
      "User-Email": email.text.toString(),
      "User-Contact": cont.text.toString(),
      "User-Age": age.text.toString(),
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FetchScreen(),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState

    name.text = widget.u_name;
    email.text = widget.u_email;
    cont.text = widget.u_contact;
    age.text = widget.u_age;
    super.initState();
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
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Form(
                    key: _formkey,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          //Logo
                          Icon(
                            Icons.lock_outlined,
                            size: 100,
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          Text(
                            'Welcome to Update Page',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: name,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == " ") {
                                  return "Name is Required";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("Enter Your Name"),
                                hintText: "Your Name",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: email,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == " ") {
                                  return "Email is Required";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("Enter Your Email"),
                                hintText: "Your Email",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: age,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == " ") {
                                  return "age is Required";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("Enter Your age"),
                                hintText: "Your age",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                prefixIcon: Icon(Icons.border_inner_rounded),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: cont,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == " ") {
                                  return "contact is required";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("Enter Your Contact"),
                                hintText: "Your Contact",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                prefixIcon: Icon(Icons.contact_mail),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),

                          ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  userupdate();
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
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  backgroundColor: Colors.black,
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                              ))
                        ],
                      ),
                    )),
              ],
            )));
  }
}
