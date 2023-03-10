import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'package:untitled/onBoarding.dart';
import 'package:untitled/register.dart';
import 'package:untitled/style.dart';

class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            Image.asset('assets/images/choice.png'),
            const SizedBox(height: 40,),
             Text('If You Have an Account ',style: googlebodyMovee,),
            MaterialButton(onPressed: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LogIn();
                })),color: const Color(0xFF443C68),child: Text('Login',style: googleTopicWhite,),),
            const SizedBox(height: 40,),
            Text('If You Don\'t Have an Account ',style: googlebodyMovee,),
            MaterialButton(onPressed: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const Register();
                })),color: const Color(0xFF443C68),child: Text('Register',style: googleTopicWhite,),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF443C68),
        onPressed: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return Onboarding_Screen();
            })),
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
