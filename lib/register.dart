import 'package:flutter/material.dart';
import 'package:untitled/style.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int count = 0; //Global Variable
  final GlobalKey<FormState> _formKey  =
  GlobalKey<FormState>(); //to check form state
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/log.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.4),
                      BlendMode.modulate,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register Now",
                        textAlign: TextAlign.center,
                        style: googleTopicMovee,),
                      const SizedBox(height: 30,),
                      //first name
                      SizedBox(
                        width: .76 * size.width,
                        height: 35,
                        //mail
                        child: TextFormField(
                            controller:
                            emailcontroller,
                            validator: (String? input) {
                              if (input != null &&
                                  input.isEmpty != true) {
                                return null;
                              }
                              else {
                                return "please rewrite your name again";
                              }
                            },
                            //maxLength: 70,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF443C68),
                                  ),
                                ),
                                labelText: 'Enter Your First Name ',
                                hintText: 'Azza'
                              // hintText: 'Email Or Phone Number',
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //last name
                      SizedBox(
                        width: .76 * size.width,
                        height: 35,
                        //mail
                        child: TextFormField(
                            controller:
                            emailcontroller,
                            validator: (String? input) {
                              if (input != null &&
                                  input.isEmpty != true) {
                                return null;
                              }
                              else {
                                return "please rewrite your last Name again";
                              }
                            },
                            //maxLength: 70,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF443C68),
                                  ),
                                ),
                                labelText: 'Enter Your Last Name ',
                                hintText: 'Bahloul'
                              // hintText: 'Email Or Phone Number',
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //mail
                      SizedBox(
                        width: .76 * size.width,
                        height: 35,
                        //mail
                        child: TextFormField(
                            controller:
                            emailcontroller,
                            validator: (String? input) {
                              if (input != null &&
                                  input.isEmpty != true &&
                                  input.contains('@') &&
                                  input.contains('.com')) {
                                return null;
                              }else if(input!.contains("@")==0){
                                return "Your mail must contain @";
                              }else if(input!.contains(".com")==0){
                                return "Your mail must contain end with .com";
                              }
                              else {
                                return "please rewrite your mail again";
                              }
                            },
                            //maxLength: 70,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF443C68),
                                  ),
                                ),
                                labelText: 'Enter Your Email ',
                                hintText: 'example@gmail.com'
                              // hintText: 'Email Or Phone Number',
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //passward
                      SizedBox(
                        width: .76 * size.width,
                        height: 35,
                        child: TextFormField(

                            validator: (String? input) {
                              if (input != null &&
                                  input.isEmpty != true &&
                                  input.length > 6) {
                                return null;
                              } else {
                                return "password week";
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF443C68),
                                  ),
                                ),
                                labelText: 'Enter password',
                                hintText: '*****************'                      )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: .76 * size.width,
                        height: 35,
                        child: TextFormField(

                            validator: (String? input) {
                              if (input != null &&
                                  input.isEmpty != true &&
                                  input.length > 6) {
                                return null;
                              } else {
                                return "password week";
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF443C68),
                                  ),
                                ),
                                labelText: 'Confirm password',
                                hintText: '*****************'                      )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        minWidth: 100,
                        textColor: Colors.black,
                        color: const Color(0xFF443C68),
                        child:  Text(
                          'Register',
                          style: googlebodywhite,
                        ),
                        onPressed: () {
                          setState(() {
                            print(_formKey.currentState!.validate(
                              //check

                            ));
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                Navigator.popAndPushNamed(context, 'home');
                              }
                            });
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}