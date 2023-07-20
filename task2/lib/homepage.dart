import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'main.dart';
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
    return Scaffold(
       appBar: AppBar(
         backgroundColor:Theme.of(context).colorScheme.inversePrimary,

           title: const Text('GITHUB REPOSITORIES'),
       ),
      body:
        Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context , snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: samplepost.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          color: Colors.black,
                          padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name:${samplepost[index].name}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontSize: 20),
                                ),
                                Text('Visibility : ${samplepost[index].visibility}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontSize: 15),
                                ),
                                Text('description: ${samplepost[index].description}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                                Text('default branch: ${samplepost[index].defaultBranch}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontSize: 15),
                                ),
                                Text('Lisence: ${samplepost[index].license}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontSize: 15),
                                ),
                                Text('Language: ${samplepost[index].language}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontSize: 15),
                                ),
                                ElevatedButton(onPressed:(){

                                    launchURL("${samplepost[index].htmlUrl}");

                                }, child: const Text('Go to this Repository'), )

                              ]
                          ),
                        ),

                    );
                  }
              );
            }
            else{
              return const Center(child: CircularProgressIndicator (),
              );
            }
          }
        ),
      ),
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
