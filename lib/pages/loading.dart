import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{


    // // Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    // Response response = await get(url) ;
    // Map data = jsonDecode(response.body);
    //
    // print(data);
    // print(data['title']);


    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.get('https://jsonplaceholder.typicode.com/todos/1'));



    // //  simulate network request for a username
    // String username = await Future.delayed(Duration(seconds: 3), (){
    //   return 'JOHN MARK';
    // });
    //
    // //simulate network request to get bio of the username
    // String bio = await Future.delayed(Duration(seconds: 2), (){
    //   return 'vega, musician & egg collector';
    // });
    //
    // print('$username - $bio');




  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
