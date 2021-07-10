import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the UI
  late String time; // the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  late bool isDayTime; //checks to see if it is day or night

  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async{

    try{
      var timeurl = Uri.parse('http://worldtimeapi.org/api/timezone/$url');

      Response response = await get(timeurl);
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //check if current time past 6am and not more than 8pm to determine that its daytime
      isDayTime = now.hour > 6 && now.hour <20 ? true : false;

      //set and format the time property
      time = DateFormat.jm().format(now);

      // print(now);

      // // Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
      // Response response = await get(url) ;
      // Map data = jsonDecode(response.body);
      //
      // print(data);
      // print(data['title']);

      // var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
      // var response = await http.get(url);
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

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
    }catch(e){
      print('caught this error: $e');
      time = 'could not get the time data';
    }

  }

}
