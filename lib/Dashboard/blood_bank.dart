import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Blood_Bank extends StatefulWidget {
  const Blood_Bank({super.key});

  @override
  State<Blood_Bank> createState() => _Blood_BankState();
}

class _Blood_BankState extends State<Blood_Bank> {

  List<dynamic>posts=[];
  Future<void>fetchData()async{
    final response=await get(Uri.parse("https://raw.githubusercontent.com/riadrayhan/BloodFighter/origin/blood_bank"));
    if(response.statusCode==200){
      setState((){
        posts=json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xDDFD2424),
        appBar: AppBar(
            title: Text("Blood Bank",style: TextStyle(color: Colors.white),),
            centerTitle: true,
          backgroundColor: Color(0xDDB70404),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(posts.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width/1,
                    child: Card(
                      elevation: 10,
                      child: Row(
                        children: [

                          IconButton(
                          onPressed: () async {
                    await launch('tel:${posts[index]['number']}');
                    },
                      icon: Icon(Icons.call, color: Colors.green),
                      iconSize: 40,
                            color: Colors.redAccent,
                    ),
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Text(posts[index]['name'],textAlign: TextAlign.center),
                              SizedBox(height: 5),
                              Text(posts[index]['location'],textAlign:TextAlign.center),
                              SizedBox(height: 5),
                              Text(posts[index]['number'],),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ),
                );
              }),
            ),
          ),
        )
    );
  }
}
