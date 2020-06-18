import 'package:flutter/material.dart';
import 'package:tugas_12/color_bloc.dart';

class Bloc1 extends StatefulWidget {
  @override
  _Bloc1State createState() => _Bloc1State();
}

class _Bloc1State extends State<Bloc1> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.black,
            child: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.red,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_red);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.blue,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_blue);
            },
          )
        ]),
        appBar: AppBar(
          title: Text("Bloc Tanpa Library"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.red,
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: 100,
                width: 100,
                color: snapshot.data,
              );
            },
          ),
        ),
      ),
    );
  }
}
