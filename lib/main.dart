import 'package:flutter/material.dart';
import 'seriveSelection.dart';
import 'package:firebase_core/firebase_core.dart';

 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

    body: Column(
      children: [
        Expanded(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/1.758,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/background1.png')),
                  ),
                ),
                Container(
                    width: 200,
                    height: MediaQuery.of(context).size.height/100,
                    margin: EdgeInsets.all(24),
                    padding: EdgeInsets.only(top: 24),
                    alignment: Alignment.center,

              ),
                Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => home(),
                      ),
                      );
                    },
                    color: Color(0xff655ee6),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: "Antipasto",
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
}