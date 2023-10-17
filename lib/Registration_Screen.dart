import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login_Page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cont = TextEditingController();



  var _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    email.dispose();
    pass.dispose();
    cont.dispose();


  }
  @override
  Widget build(BuildContext context) {
    
    void createUser()async{
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.toString(), password: pass.text.toString());
      } on FirebaseAuthException catch(ex){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ex.code.toString()}")));
      }


    }
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

                              Text('Welcome to Registration Page', style: TextStyle(
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
                                  controller: cont,
                                  validator: (value){
                                    if(value == null || value.isEmpty || value == " "){
                                      return "Contact is Required";
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
                                    prefixIcon: Icon(Icons.contacts),
                                  ),
                                ),
                              ),



                              SizedBox(height: 20,),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller: pass,
                                  validator: (value){
                                    if(value == null || value.isEmpty || value == " "){
                                      return "Password is required";
                                    }
                                  },
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    label: Text("Enter Your Password"),
                                    hintText: "Your Password",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                        )
                                    ),
                                    prefixIcon: Icon(Icons.password),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),

                              Container(
                                margin: EdgeInsets.only(left: 200),


                                child: Column(
                                  children: [
                                    Text("Already Have an Account", style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey
                                    ),)

                                  ],
                                ),
                              ),


                              SizedBox(height: 20,),

                              ElevatedButton(onPressed: (){
                                createUser();
                                if (_formkey.currentState!.validate()){
                                  print(name.text.toString());
                                  print(email.text.toString());
                                  print(cont.text.toString());
                                  print(pass.text.toString());
                                  name.clear();
                                  email.clear();
                                  cont.clear();
                                  pass.clear();
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage() ));

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
