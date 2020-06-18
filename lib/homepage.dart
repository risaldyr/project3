import 'package:flutter/material.dart';
import 'package:tugas_12/bloc_dengan_library.dart';
import 'package:tugas_12/bloc_tanpa_library.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Home Page"),
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Bloc1();
                          },
                        ));
                      },
                      child: Text("Bloc Tanpa Library"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Bloc2();
                          },
                        ));
                      },
                      child: Text("Bloc Dengan Library"),
                    )
                  ]),
            )));
  }
}
