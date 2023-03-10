import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);


  @override

  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  List news=[];

  @override
  void initState() {
    print('init state calles');
    getDate();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: news.isEmpty?CircularProgressIndicator():ListView.separated(
        itemBuilder: (context,index){
        return Container(
          color: Color(0xFFCCC7DB),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(news[index],textAlign: TextAlign.center,),
                const Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Color(0xFF443C68),
                )
              ],
            ),
          )

        );
      },
        separatorBuilder: (context,index){
          return Container(
            color: const Color(0xFF443C68),
            width: double.infinity,
          );
        },
      itemCount: news.length,),
    );
  }


getDate()async {
  var response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=eg&apiKey=5474462c7ad349e9b60519aeca8e844c'));
  print(response.statusCode);
  var data = jsonDecode(response.body);
  var dataList = data['articles'];

  setState(() {
    print(data);
  for (var item in dataList) {
    String title = item['title'];
    news.add(title);
  }
});
  }
}

