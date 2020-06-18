import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc2.dart';

class Bloc2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(builder: (context)=>ColorBloc(),
        child: Bloc3()),
    );
  }
}

class Bloc3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return MaterialApp(
      home: Scaffold(
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.black,
            child: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.yellow,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_yellow);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_blueGrey);
            },
          )
        ]),
        appBar: AppBar(
          title: Text("Bloc Dengan Library"),
        ),
        body: Center(
          child: BlocBuilder<ColorBloc, Color>(
                      builder: (context, currentColor)=> AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 100,
              width: 100,
              color: currentColor,
            ),
          ),
        ),
      ),
    );
  }
}
