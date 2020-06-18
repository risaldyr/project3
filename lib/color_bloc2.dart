import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_yellow, to_blueGrey}

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.yellow;
  @override
  Color get initialState => Colors.yellow;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_yellow) ? Colors.yellow : Colors.blueGrey;
    yield _color;
  }
}
