

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: FutureBuilder<CityModel>(
        future: getCity(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              final info = snapshot.data;

              return Column(
                children: [
                  Container(height:450,width: 400,
                  child: (Image.asset("assets/pic.jpg")
                  )),
                  SizedBox(height: 45,),
                  Text("Name : ${info.name} \n Mayor : ${info.mayor}"),
                  Text("Description : ${info.description}"),
                  Text("Population : ${info.population}"),
                ],
              );
              

            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<CityModel> getCity() async {
    final url = 'https://5g54ki0phj.execute-api.us-east-1.amazonaws.com/dev/get-city/seattle';
    final response = await http.get(url);





    if (response.statusCode == 200) {
      final jsonCity = jsonDecode(response.body);
      return CityModel.fromJson(jsonCity);
    } else {
      throw Exception();
    }
  }
}
