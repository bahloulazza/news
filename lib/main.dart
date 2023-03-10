import 'package:flutter/material.dart';
import 'package:untitled/Profile.dart';
import 'package:untitled/splashSceen.dart';

import 'login.dart';

void main(){
  runApp(const App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        'home':(BuildContext context){
          return const Profile();
        },
        'Log':(context){
          return const LogIn();
        },
        'splash':(context){
          return const Splash();
        }
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
    );
  }
}

