import 'package:flutter/material.dart';
import 'package:untitled/style.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                  const SizedBox(
                    height: 70,
                  ),
                   Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: googleTopicMovee,),
                  const SizedBox(height: 30,),
                  SizedBox(
                    width: .76 * size.width,
                    height: 35,
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
                          hintText: 'example@gmail.com',

                          // hintText: 'Email Or Phone Number',
                        ),),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: .76 * size.width,
                    height: 75,
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
                                color:  Color(0xFF443C68),
                              ),
                            ),
                          labelText: 'Enter your password',
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
                      'login',
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