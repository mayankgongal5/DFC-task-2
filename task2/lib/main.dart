import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:task2/homepage.dart';
import 'package:task2/modle/repo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_url/open_url.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}







// final Uri _url = Uri.parse('https://flutter.dev');
// Future<void> _launchURL(String url) async {
//   final Uri uri = Uri(scheme: "https", host: url);
//   if (!await launchUrl(
//     uri,
//     mode: LaunchMode.externalApplication,
//   )) {
//     throw "Can not launch url";
//   }
// }
Future launchURL(String url) async {
  // you need to parse the url
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception("Can not launch $uri");
  }
}
FutureOr<Welcome>fetchRepos() async {
  final result = await openUrl('https://github.com/renatoathaydes/open_url');
  if (result.exitCode == 200) {
    print(result.exitCode);
    return Welcome.fromJson(json.decode(result.exitCode as String));
  } else {
    throw Exception('Failed to fetch repos!');

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var searchText = TextEditingController();
  late FutureOr<Welcome> futurerepo ;
  @override
  void initState() {
    super.initState();
    futurerepo =fetchRepos();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("DFC-Task 2",
        style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: SlidingUpPanel(
          minHeight: 100,
          maxHeight: 400,
          backdropEnabled: true,
          backdropColor: Colors.black,
          backdropOpacity: 0.8,
          backdropTapClosesPanel: true,
          color: Colors.black,
          renderPanelSheet: false,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(
                          color: Colors.white
                        ),
                          keyboardType: TextInputType.text,
                          controller: searchText,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 3,

                                  )
                              ) ,
                              hintText: "Search ",
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(Icons.search_off_sharp,color: Colors.white),



                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),


                              )
                          )


                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            height: 250,
                            width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(120),
                                image: const DecorationImage(
                                 image: AssetImage('assets/pictures/my.jpeg'),
                                 fit: BoxFit.scaleDown,
                             ),
                          )
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15,top: 15),
                        child: Text('Mayank Ashok Gongal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontStyle: FontStyle.normal
                          ),

                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Government College of Engineering Nagpur',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.normal
                          ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('B.tech Computer Science'
                          ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.normal
                          ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Skills: Flutter,Video Editing,Java'
                          ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.normal
                          ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('This is Task 2 of DFC 2023'
                          ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.normal
                          ),),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
      ),
      )
    );
  }

  Widget _floatingCollapsed() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
            ),
            margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
            child: const Center(
              child: Text(
                "Connect With Me swip up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: (25),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey,
              ),
            ]),
        margin: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // make sure you add the url with the http://
                          launchURL("https://www.instagram.com/hell_ew.dmg/");
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/icons/insta2.png'),
                                fit: BoxFit.scaleDown,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          launchURL("https://youtube.com/@MayankGongal5");
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/icons/youtube.png'),
                                fit: BoxFit.scaleDown,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          launchURL("https://twitter.com/mayank_gongal");
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/icons/twit2.png'),
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            launchURL("http://github.com/mayankgongal5");
                          },
                          child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/git2.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                             launchURL("https://www.linkedin.com/in/mayank-gongal-0bb742256");
                          },
                          child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/link2.png'),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
                              return const homepage();
                            }));
                          },
                          child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/api.png'),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],

                  ),

                ),

              ),

            ],
          ),
        ));
  }
}
  //hello

