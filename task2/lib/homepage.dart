import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'modle/repo.dart';
class homepage extends StatefulWidget{
  const homepage({Key? key}): super(key: key);
  @override
  State<homepage> createState()=> _homepagestate();
}
class _homepagestate extends State<homepage> {
  List<Welcome> samplepost = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context , snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: samplepost.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flexible(
                    child: Container(
                      height: 300,
                      color: Colors.green,
                      padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('name: ${samplepost[index].name}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('html_url : ${samplepost[index].htmlUrl}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('description: ${samplepost[index].description}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('strgazerscount: ${samplepost[index].stargazersCount}',
                              style: TextStyle(fontSize: 20),
                            )

                          ]
                      ),
                    ),
                  ),
                );
              }
          );
        }
        else{
          return Center(child: CircularProgressIndicator (),
          );
        }
      }
    );
  }

  Future<List<Welcome>> getData() async {
    final response = await http.get(
        Uri.parse('https://api.github.com/users/mayankgongal5/repos'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (Map<String, dynamic> index in data) {
        samplepost.add(Welcome.fromJson(index));
      }
      return samplepost;
    } else {
      return samplepost;
    }
  }

}
