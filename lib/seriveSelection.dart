

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'AnnouncementList.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:convert';

class home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title:

            Text(
              'Home',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontFamily: "Antipasto"
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Colors.black,
                iconSize: 35,
              ),
            ],

      ),


      body: myapp(),
    );

  }
}

class myapp extends StatefulWidget {

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {

  @override



  Widget build(BuildContext context)  {


    var size = MediaQuery.of(context).size;


    Widget customURLButton(String text, String URL, Icon icon){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 10/1,
          child: RaisedButton(
            splashColor: Color(0xff655ee6),
            color: Colors.white,
            elevation: 3,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyWebView(
                    title: text,
                    selectedUrl: URL,
                  )));
            },
            child: Row(
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                      text,
                      style: TextStyle(
                      fontFamily: 'Antipasto',
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }





    Widget customNAVIGATORButton(String text, Widget page ,Icon icon){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          splashColor: Color(0xff655ee6),
          color: Colors.white,
          elevation: 3,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => page,
                ));
          },
          child: Row(
            children: [
              icon,
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Antipasto',
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }




    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              width: size.width,
              height:  size.height * 0.1,
              child: Card(
                color: Color(0xff655ee6),
                child: SizedBox(
                  child: Center(
                    child: Text(
                      'Welcome to Parivahan Sewa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Antipasto",
                      ),

                    ),
                  ),
                ),
              ),
            ),
            StreamProvider<QuerySnapshot>.value(
              value: DatabaseService().announcements,
              child: Container(
                width: size.width,
                height:  size.height * 0.1,
                child: Card(
                  color: Color(0xff655ee6),
                  child: SizedBox(
                    child: Center(
                      child: AnnouncementList()
                      ),
                    ),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Driving License Related Services',
                    style: TextStyle(
                      fontSize: 20,

                      fontFamily: "Antipasto"
                    ),
                  ),
                  Container(
                    width: size.width/5,
                  ),

                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: size.width/1.05,
              child: Card(
                elevation: 0,
                color: Colors.white,
                  child: Wrap(
                    children: [
                      customNAVIGATORButton("Apply Online", ApplyOnline() ,Icon(Icons.input)),


                    ],
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Below is the code for WEBVIEW page to be navigated to.

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff655ee6),
          title: Text(title),
        ),
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}

// Above is the code for WEBVIEW page to be navigated to.





class ApplyOnline extends StatefulWidget {
  @override
  _ApplyOnlineState createState() => _ApplyOnlineState();
}

class _ApplyOnlineState extends State<ApplyOnline> {
  @override

  Widget customURLButton(String text, String URL, Icon icon){

  ;}

  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xff655ee6),
        appBar: AppBar(
          backgroundColor: Color(0xff655ee6),
          title: Text("Apply Online"),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString("assets/json/example.json"),
              builder: (context,snapshot){
                var mydata = json.decode(snapshot.data.toString());
                if(mydata == null){
                  return Center(
                    child: CircularProgressIndicator(
                    ),
                  );
                }
                else {
                  return ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text("dummy"),
                        leading: Icon(Icons.import_contacts),

                      ),
                    );
                  },
                );}
              },
            ),
          ),
        ),
        );
  }
}

