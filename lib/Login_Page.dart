import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_Screen.dart';
import 'Registration_Screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.toString(), password: pass.text.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(),));
      SharedPreferences userLoginDetails = await SharedPreferences.getInstance();
      userLoginDetails.setBool("userLoggedIn", true);

    } on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ex.code.toString()}")));

    }

  }

  var _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    pass.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  Form(
            key: _formkey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  //Logo
                  Icon(Icons.lock,
                  size: 100,
                  ),

                  SizedBox(height: 50,),

                  Text('Welcome to Login Page', style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
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
                  
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 200),
                      child: Column(
                        children: [
                          Text("Don't have an account?", style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey
                          ),)

                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen())
                      );
                    },
                  ),


                  SizedBox(height: 20,), 

                  ElevatedButton(onPressed: (){
                    if (_formkey.currentState!.validate()){
                     showDialog(context: context, builder: (context){
                       return AlertDialog(
                         title: Text("User Login"),
                         content: Text("Login Succesful"),
                         actions: [
                           ElevatedButton(onPressed: (){
                             userLogin();
                           }, child: Text("Login")),
                           OutlinedButton(onPressed: (){

                             Navigator.pop(context);
                             email.clear();
                             pass.clear();

                           }, child: Text("Cancel"))
                         ],
                       );
                     });

                    }

                  },



                       child: Text("Login" , style: TextStyle(
                         backgroundColor: Colors.black,
                         color: Colors.white,
                         fontSize: 40,


                       ),))




                        ],
                      ),
            )
                )

      );








  }
}
