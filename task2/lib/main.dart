import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse('https://flutter.dev');
Future<void> _launchURL(String url) async {
  final Uri uri = Uri(scheme: "https", host: url);
  if(!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Can not launch url";
  }
}

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text("heeelllooo"),
      ),
      body: Container(
        decoration:  const BoxDecoration(
            color: Colors.black

        ),


        child: SlidingUpPanel(
          color: Colors.black,
          renderPanelSheet: false,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body: const Center(
            child: Text("This is the Widget behind the sliding panel"),
          ),
        ),
      ),
    );
  }

  Widget _floatingCollapsed(){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child:  const Center(
        child: Text(
          "Connect With Me",
              style: TextStyle(
            color: Colors.blue,
                fontSize:(30),
        ),
        ),
      ),
    );
  }


  Widget _floatingPanel(){
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]
      ),
      margin: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: (){
                        _launchURL("www.instagram.com/hell_ew.dmg");
                      },
                      child: Container(

                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/icons/inst.png'),

                              fit:BoxFit.scaleDown,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          )
                      ),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: (){
                        // _launchURL("https://twitter.com/mayank_gongal");
                      },
                      child: Container(

                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/icons/wtit.png'),
                              fit:BoxFit.scaleDown,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          )
                      ),
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
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          // _launchURL("https://github.com/mayankgongal5");
                        },
                        child: Container(

                            height: 100,
                            width: 100,
                           decoration: BoxDecoration(
                             image: const DecorationImage(
                               image: AssetImage('assets/icons/git.png'),
                                 fit:BoxFit.scaleDown,
                             ),
                            borderRadius: BorderRadius.circular(10),
                             color: Colors.black,
                        )
                           ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          // _launchURL("https://www.linkedin.com/in/mayank-gongal-0bb742256/");
                          },
                        child: Container(

                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/icons/link.png'),
                                fit:BoxFit.scaleDown,


                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],


        ),
      )
    );

  }
  }
  //hello

