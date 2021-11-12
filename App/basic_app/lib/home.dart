import 'dart:convert';

import 'package:basic_app/function.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "";
  // ignore: prefer_typing_uninitialized_variables
  var data;
  String output = "Initial Output";
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value){
                  url = "http://10.0.2.2:5000/api?query=" + value.toString();
                },
              ),
              TextButton(onPressed: () async {
                data = await fetchdata(url);
                var decoder = jsonDecode(data);
                setState(() {
                  output = decoder["output"];
                });
              }, child: const Text("FETCH ASCII VALUE", style: TextStyle(
                fontSize: 20
              ),),),
              // ignore: prefer_const_constructors
              Text(output, style: TextStyle(
                fontSize: 40,
                color: Colors.green
              ),)
              
            ],
          ),
        ),
      ),
    );
  }
}
