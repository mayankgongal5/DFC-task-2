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
         backgroundColor: Colors.black,

           title: const Text('MY GITHUB REPOSITORIES',
           style: TextStyle(
             color: Colors.white,
           ),),
         iconTheme: const IconThemeData(color: Colors.white),
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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)
                            ),

                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.black,Colors.teal]
                            )
                          ),
                          height: 300,

                          padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text('${samplepost[index].name}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                        fontSize: 25),
                                  ),
                                ),
                                Text('Visibility : ${samplepost[index].visibility}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontSize: 15),
                                ),
                                Text('Description: ${samplepost[index].description}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15),
                                  maxLines: 1,
                                ),
                                Text('Default branch: ${samplepost[index].defaultBranch}',
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
